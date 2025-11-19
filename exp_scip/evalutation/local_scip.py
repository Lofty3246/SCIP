import os
import sys
from pyscipopt import Model
import pyscipopt as scip
import time
sys.path.append('/home/lsy/Desktop/HUAWEI/exp_scip')

def solve_single_lp(file_path):
    result = {
        "file": file_path,
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
        model.readProblem(file_path)
        
        # 设置求解参数（可选）
        # model.setHeuristics(scip.SCIP_PARAMSETTING.OFF)
        model.setParam("limits/time", 300)  # 单个问题最大求解时间 300 秒
        model.setParam("display/verblevel", 4)  # 详细日志（仅输出结果）
        model.includeHeurMydiving()

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

        # 若找到最优解，记录目标值和变量解
        if status == "optimal":
            result["obj_val"] = round(model.getObjVal(), 6)
            result["dualbound"] = round(model.getDualbound(), 6)
            result["primalbound"] = round(model.getPrimalbound(), 6)
            if result["primalbound"] == 0:
                result["gap"] = abs(result["dualbound"]-result["primalbound"])
            else:
                result["gap"] = abs(result["dualbound"] - result["primalbound"]) / abs(result["primalbound"])
            print("gap=",result["gap"],"solve_time=",result["solve_time"])
            # 记录变量解（只保留非零值或所有值，根据需求调整）
            variables = {}
            for var in model.getVars():
                var_name = var.name
                var_val = round(model.getVal(var), 6)
                variables[var_name] = var_val
            result["variables"] = variables

        # 释放模型资源
        model.freeProb()

    except Exception as e:
        result["error"] = str(e)  # 记录错误信息

    return result

def batch_solve_lp_folder(folder_path):
    gap_list = []
    solve_time_list = []
    lp_files = [
        os.path.join(folder_path, f)
        for f in os.listdir(folder_path)
        if f.lower().endswith(".lp")
    ]
    if not lp_files:
        print(f"文件夹 {folder_path} 中没有找到 .lp 文件！")
        return
    print(lp_files)
    
    # 遍历求解所有 LP 文件
    total = len(lp_files)
    for i, file_path in enumerate(lp_files, 1):
        file_name = os.path.basename(file_path)
        print(f"正在求解 ({i}/{total})：{file_name}")
        # 求解单个文件
        result = solve_single_lp(file_path)
        gap_list.append(result['gap'])
        solve_time_list.append(result['solve_time'])
        
    print("solving time=",sum(solve_time_list))
    print("relative primal gap=",sum(gap_list)/len(gap_list))
    
        
if __name__ == "__main__":
    lp_folder = "/home/lsy/Desktop/HUAWEI/exp_scip/testingdata/facility"  
    # 批量求解并保存结果
    batch_solve_lp_folder(lp_folder)
    
# only scip facility
# solving time= 624.92(617.47)

# diving for facility
# solving time= 495.55(492.66)
# 20.7%

# diving for indset
# solving time= 114.15

# only scip indset
# solving time= 113.51(114.6)


# only scip setcover
# solving time= 239.56

# diving for setcover
# solving time= 267.07

# only scip ca
# solving time= 48.58

# diving for ca
# solving time= 52.02
