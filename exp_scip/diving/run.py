import numpy as np
import importlib
import types
import warnings
import sys 
sys.path.append('/home/lsy/Desktop/HUAWEI/EoH/eoh/src/eoh/problems/optimization/bp_online')
import os
import time
from pyscipopt import Model
import pyscipopt as scip
from .prompts import GetPrompts


class DIVING():
    def __init__(self):
        self.folder_path = "/home/lsy/Desktop/HUAWEI/exp_scip/trainingdata/ca"  
        self.heur_path = "/home/lsy/Desktop/HUAWEI/exp_scip/diving.py"
        self.prompts = GetPrompts()
    # --- 核心求解函数 ---
    def solve_single_lp(self,folder_path):
        result = {
            "file": self.folder_path,
            "status": None,
            "obj_val": None,
            "dualbound": None,
            "primalbound": None,
            "gap": None,
            "solve_time": None,
            "variables": None,
            "error": None
        }

        try:
            # 创建模型
            model = Model()
            # 读取 LP 文件
            model.readProblem(folder_path)
            
            # 设置求解参数
            # model.setHeuristics(scip.SCIP_PARAMSETTING.OFF)  
            model.setParam("limits/time", 300)          # 时间限制 300 秒
            model.setParam("display/verblevel", 1)      # 减少输出，提升性能（设为1可看进度）
            model.includeHeurMydiving()                 # 包含自定义潜水启发式

            # 记录开始时间
            start_time = time.time()
            # 求解
            model.optimize()
            # 计算求解时间
            solve_time = time.time() - start_time

            # 获取求解状态
            status = model.getStatus()
            result["status"] = status
            result["solve_time"] = round(solve_time, 2)

            # 若找到可行解，记录目标值和 bounds
            if status == "optimal":  
                obj_val = model.getObjVal()  
                dual_bound = model.getDualbound()
                
                result["obj_val"] = round(obj_val, 6)
                result["dualbound"] = round(dual_bound, 6)
                result["primalbound"] = round(obj_val, 6)  

                # 计算 GAP
                if abs(obj_val) > 0:  # 避免除以零
                    gap = abs(obj_val - dual_bound) / abs(obj_val)
                else:
                    gap = abs(obj_val - dual_bound)  # 如果目标值接近0，用绝对GAP
                result["gap"] = round(gap, 6)

            # 释放模型资源
            model.freeProb()

        except Exception as e:
            result["error"] = str(e)

        return result

    def evaluateGreedy(self) -> float:

        lp_files = [
            os.path.join(self.folder_path, f)
            for f in os.listdir(self.folder_path)
            if f.lower().endswith(".lp")
        ]
        total_solve_time = 0.0
        solved_count = 0
        gap_sum = 0.0

        for i, file_path in enumerate(lp_files, 1):
            file_name = os.path.basename(file_path)
            result = self.solve_single_lp(file_path)
            print(f"{file_name}求解时间: {result['solve_time']} 秒, GAP: {result['gap']}")
            if result["status"] in ["optimal"]:
                total_solve_time += result["solve_time"]
                solved_count += 1
                gap_sum += result["gap"]
        
        if solved_count > 0:
            avg_gap = gap_sum / solved_count
        # fitness = total_solve_time
        fitness = total_solve_time

        return fitness


    def evaluate(self, code_string):
        try:
            with warnings.catch_warnings():
                warnings.simplefilter("ignore")

                # Create a new module object
                heuristic_module = types.ModuleType("heuristic_module")
                
                # Execute the code string in the new module's namespace
                exec(code_string, heuristic_module.__dict__)

                # Add the module to sys.modules so it can be imported
                sys.modules[heuristic_module.__name__] = heuristic_module

                fitness = self.evaluateGreedy()

                return fitness
        except Exception as e:
            print(f"Evaluation error: {e}")  # 打印具体错误
            # import traceback
            # traceback.print_exc()  # 打印完整堆栈
            return None
if __name__ == "__main__":
    diving = DIVING()
    result=diving.evaluateGreedy() 
    print("fitness=",result)




