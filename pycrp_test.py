import numpy as np
from pyvrp import Client, Depot, ProblemData, VehicleType
from pyvrp.solve import solve
from pyvrp.stop import MaxRuntime
import os
import json

'''
保存脚本
python pycrp_test.py > cvrp_solution.log 2>&1

'''

'''
data = {
    'name': 'test100_dataset_61_easy_0',
    'demands': [0.0, 6.0, 1.0, 4.0, 5.0, 6.0, 9.0, 6.0, 5.0, 2.0, 5.0, 7.0, 2.0, 2.0, 7.0, 4.0, 8.0, 7.0, 4.0, 4.0, 6.0],
    'coordinates': [
        [0.5, 0.5], [0.8210269273513516, 0.06979608226844192], [0.9838896246030469, 0.05595652940905094],
        [0.6501401502733831, 0.7421937385831255], [0.9953702577921065, 0.9663363900971838],
        [0.44271366224710473, 0.9020420608617128], [0.02037626348764765, 0.21028860812217454],
        [0.14191961290288857, 0.4897131083271564], [0.27144448677019994, 0.10718473425056319],
        [0.4506158345696416, 0.6751046985752392], [0.11781578818889171, 0.1429828967265333],
        [0.4159425036978196, 0.2601272663404002], [0.30730781390408357, 0.8431108275279039],
        [0.22644800536617138, 0.11223248238418881], [0.35778488604000047, 0.616243052377168],
        [0.9377125801413535, 0.7720600416440561], [0.02057117846541756, 0.28371969808555686],
        [0.5398340877507398, 0.9339987855630537], [0.9930735155100587, 0.3270634171165926],
        [0.5449741649166847, 0.1280048977002799], [0.7256956966776597, 0.5306645529426579]
    ],
    'capacity': 50,
    'n_customers': 20
}
'''
# === 你的原始数据 ===
# coords = [
#     [0.5, 0.5], [0.821, 0.0698], [0.9839, 0.0559], [0.6501, 0.7422],
#     [0.9954, 0.9663], [0.4427, 0.9020], [0.0204, 0.2103], [0.1419, 0.4897],
#     [0.2714, 0.1072], [0.4506, 0.6751], [0.1178, 0.1430], [0.4159, 0.2601],
#     [0.3073, 0.8431], [0.2264, 0.1122], [0.3578, 0.6162], [0.9377, 0.7721],
#     [0.0206, 0.2837], [0.5398, 0.9340], [0.9931, 0.3271], [0.5450, 0.1280],
#     [0.7257, 0.5307]
# ]
# demands = [0, 6, 1, 4, 5, 6, 9, 6, 5, 2, 5, 7, 2, 2, 7, 4, 8, 7, 4, 4, 6]
# capacity = 50

problem_list =["easy","mid","hard"]
current_dir = os.path.dirname(os.path.abspath(__file__))
for problem in problem_list:
        with open(f"{current_dir}/data/{problem}.json", "r") as f:
            datasets = json.load(f)
            for instance in datasets:
                # 对每个instance数据预处理 
                # coords
                coords = np.array(instance["coordinates"])
                n = len(coords)
                # distance_matrix
                distance_matrix = np.zeros((n, n), dtype=int)
                for i in range(n):
                    for j in range(n):
                        dx = coords[i, 0] - coords[j, 0]
                        dy = coords[i, 1] - coords[j, 1]
                        dist = np.sqrt(dx*dx + dy*dy)
                        distance_matrix[i, j] = int(round(dist * 1000))
                # depot，clinets
                depot = Depot(x=int(round(coords[0, 0] * 1000)), y=int(round(coords[0, 1] * 1000)))
                clients = [
                    Client(
                        x=int(round(coords[i, 0] * 1000)),
                        y=int(round(coords[i, 1] * 1000)),
                        delivery=[instance["demands"][i]]  # <--- 这里是关键
                    )
                    for i in range(1, n)
                ]
                # depot，clinets
                num_vehicles = 10
                vehicle_types = [VehicleType(num_available=num_vehicles, capacity=[instance["capacity"]])]

                # 创建 ProblemData 
                data = ProblemData(
                    clients=clients,
                    depots=[depot],
                    vehicle_types=vehicle_types,
                    distance_matrices=[distance_matrix],      
                    duration_matrices=[distance_matrix],      
                )
                # 直接求解 
                result = solve(
                    data=data,
                    stop=MaxRuntime(30),
                    seed=42,
                    display=True
                )

                print(result.best)
                print(f"Total distance: {result.cost()}")  
