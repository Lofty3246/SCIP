import pyscipopt
import os
import datetime
import numpy as np
def open_diving(model):
    diving_heuristics_names = [
        'actconsdiving',      # Active Constraint Diving
        'coefdiving',         # Coefficient Diving
        'completesol',        # Complete Partial Solution (有时归类为 diving-like)
        'conflictdiving',     # Conflict Analysis Diving
        'distributiondiving', # Distribution Based Diving
        'farkasdiving',       # Farkas Proof Diving
        'fracdiving',         # Fractional Diving (最常用之一)
        'guideddiving',       # Guided Diving
        'intdiving',          # Integer Diving
        'linesearchdiving',   # Line Search Diving
        'objpscostdiving',    # Objective Pseudo-Cost Diving
        'pscostdiving',       # Pseudo-Cost Diving
        'rootsoldiving',      # Root Solution Diving
        'rounding'           # Rounding (基础 diving 启发式)
     # Variable Type Diving,      # Zero Objective Diving
                ]
    diving_heuristics_param = {}
    for heur in diving_heuristics_names:
        try:
            param_name_freq = f"heuristics/{heur}/freq"
            param_name_freqofs = f"heuristics/{heur}/freqofs"
            freq = model.getParam(param_name_freq)
            freqofs = model.getParam(param_name_freqofs)
            # m.getParam(param_name_freqofs)  # 启用，每 10 个节点尝试一次
            diving_heuristics_param[heur] = {"freq":model.getParam(param_name_freq),
            "freqofs":model.getParam(param_name_freqofs)}
            # print(f"diving heuristic: {heur}，freq:{freq},freqofs:{freqofs}")
        except:
            print(f"Warning: Could not get freq for {heur} (maybe not available)")
    model.setHeuristics(pyscipopt.SCIP_PARAMSETTING.OFF)
    for heur in diving_heuristics_names:
        try:
            param_name_freq = f"heuristics/{heur}/freq"
            param_name_freqofs = f"heuristics/{heur}/freqofs"
            heur_dict = diving_heuristics_param[heur]
            freq = heur_dict["freq"]
            freqofs = heur_dict["freqofs"]
            model.setIntParam(param_name_freq,int(1))
            model.setIntParam(param_name_freqofs,int(freqofs))  # 启用，每 10 个节点尝试一次
            # print(f"Enabled diving heuristic: {heur}")
        except:
            print(f"Warning: Could not set freq for {heur} (maybe not available)")
            
def run_diving_heuristic(problem):
    # 获取文件路径
    path_to_instances = f'/home/lsy/Desktop/HUAWEI/exp_scip/trainingdata/{problem}'
    path_to_save_logs = '/home/lsy/Desktop/HUAWEI/exp_scip/log1'
    # 获取实例列表
    instance_list = []
    for i in range(20):
        instance_list.append("instance_"+str(i+1)+".lp")
    # print('已加载模型用于cut选择哪些切平面')
    results = {}
    
    for instance in instance_list:
        path_to_one_instance = path_to_instances + "/" + instance
            
        logfile = path_to_save_logs + "/" + instance + ".log"
        model = pyscipopt.Model("Heuristic_Example")
        # 禁止 SCIP 求解器向控制台（stdout）打印默认的求解过程信息
        model.hideOutput()
        # 从文件读取一个优化问题（如 MIP、LP 等）并加载到模型中
        model.readProblem(path_to_one_instance)
        # 将 SCIP 的求解日志（包括你隐藏的那些输出）写入指定的日志文件
        model.setLogfile(logfile)

        # 关掉割平面
        # model.setSeparating(pyscipopt.SCIP_PARAMSETTING)  # close cutting planes
        # 关掉启发式
        # model.setHeuristics(pyscipopt.SCIP_PARAMSETTING.OFF)
        
        # 开启所有diving启发式
        open_diving(model)
                
        
        # 获取参数列表
        # params = model.getParams()
        # heur_params = [p for p in params if p.startswith('heuristics/')]
        # for p in sorted(heur_params):
        #     if "ca_diving" in p:
        #         print(p)
            
        # 这里我将启发式命名为：
        # setcover_diving
        # indset_diving
        # facility_diving
        # ca_diving    
        
        if problem == 'facility':
            model.includeHeurMydiving_facility()
        elif problem == 'setcover':
            model.includeHeurMydiving_setcover()
        elif problem == 'indset':
            model.includeHeurMydiving_indset()
        elif problem == 'ca':
            model.includeHeurMydiving_ca()
        # 调用频率/偏移量
        diving_name = f"{problem}_diving"
        freq_param = f'heuristics/{diving_name}/freq'
        freqofs_param = f'heuristics/{diving_name}/freqofs'
        
        model.setParam(freq_param,1)
        model.setParam(freqofs_param,0) 

        # 设置求解器参数———— -1表示永不调用，0表示默认行为，1表示每个节点调用一次
        # model.setParam('limits/nodes',1)
        # model.setParam('limits/totalnodes',1)
        model.setParam('limits/time', 150)
        model.setParam('display/verblevel', 4)  # 详细日志（0-5，5最详细）
        # model.setParam('limits/gap', 0.01)  # 1% gap 停止条件
        # model.setParam('numerics/feastol', 1e-6)  # 提高精度

        model.optimize() 
        print(f"{logfile} Optimization finished.")
        stats = {}
        stats['solving_time'] = model.getSolvingTime()
        stats['ntotal_nodes'] = model.getNTotalNodes()
        stats['primal_dual_gap'] = model.getGap()
        stats['primaldualintegral'] = 0
        stats['obj_val'] = model.getObjVal()
        results[logfile] = stats
    return results

def run_default_scip(problem):
    # 获取文件路径
    path_to_instances = f'/home/lsy/Desktop/HUAWEI/exp_scip/trainingdata/{problem}'
    path_to_save_logs = f'/home/lsy/Desktop/HUAWEI/exp_scip/information/{problem}'
    # 获取实例列表
    instance_list = []
    for i in range(20, 100):
        instance_list.append("instance_"+str(i+1)+".lp")
    # print('已加载模型用于cut选择哪些切平面')
    results = {}
    for instance in instance_list:
        path_to_one_instance = path_to_instances + "/" + instance
            
        logfile = path_to_save_logs + "/" + instance + ".log"
        model = pyscipopt.Model("Heuristic_Example")
        # 禁止 SCIP 求解器向控制台（stdout）打印默认的求解过程信息
        model.hideOutput()
        # 从文件读取一个优化问题（如 MIP、LP 等）并加载到模型中
        model.readProblem(path_to_one_instance)
        # 将 SCIP 的求解日志（包括你隐藏的那些输出）写入指定的日志文件
        model.setLogfile(logfile)

        # 关掉割平面
        # model.setSeparating(pyscipopt.SCIP_PARAMSETTING.OFF)  # close cutting planes
        # 开启默认启发式
        # model.setHeuristics(pyscipopt.SCIP_PARAMSETTING.DEFAULT)
        # model.setParam('heuristics/rounding/freqofs',0)

        # params = model.getParams()
        # heur_params = [p for p in params if p.startswith('heuristics/')]
        # for p in sorted(heur_params):
        #     # if "ca_diving" in p:
        #     with open("./read.log", 'a') as f:
        #         f.write(f"{p}\n")
        
        # open_diving(model)
        # model.includeHeurMydiving_ca()
        # model.setParam("branching/restarts", False)
        model.setParam('limits/time', 60)
        model.setParam('display/verblevel', 5)  # 详细日志（0-5，5最详细）
        # model.setParam('numerics/feastol', 1e-6)  # 提高精度
        model.optimize() 
        print(f"{logfile} Optimization finished.")
        stats = {}
        stats['solving_time'] = model.getSolvingTime()
        stats['ntotal_nodes'] = model.getNTotalNodes()
        stats['primal_dual_gap'] = model.getGap()
        stats['primaldualintegral'] = 0
        stats['obj_val'] = model.getObjVal()
        results[logfile] = stats
    return results

def read_result(results,problem):
    gap_list = []
    for result in results:
        gap_list.append(result.value()['solving_time'])
        with open(f'/home/lsy/Desktop/HUAWEI/exp_scip/gap_compare/{problem}',"a") as f:
            f.write(f"{result}\n")
    with open(f'/home/lsy/Desktop/HUAWEI/exp_scip/gap_compare/{problem}',"a") as f:
            f.write(f"平均值 = {np.mean(gap_list)}\n")

if __name__ == "__main__":
    # diving
    # problem =  "ca"
    problem_set = ["facility"]
    # result1 = run_diving_heuristic(problem)
    # default
    for problem in problem_set:
        result2 = run_default_scip(problem)
    
    # read_result(result1,problem)
    # read_result(result2,problem)
    
    
