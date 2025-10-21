import sys

sys.path.append('/home/lsy/anaconda3/envs/env1/lib/python3.11/site-packages')
print(sys.path)

from pyscipopt import Model
import pyscipopt as scip

# 创建模型
model = Model("MyProblem")

# 禁用所有启发式
model.setHeuristics(scip.SCIP_PARAMSETTING.OFF)
'''setHeuristics 设置所有启发式的全局参数配置'''

# 添加变量
x = model.addVar("x", vtype="B")  # 二进制变量
y = model.addVar("y", vtype="I", lb=0)  # 整数变量
z = model.addVar("z", vtype="C", lb=0)  # 连续变量

# 添加约束
model.addCons(x + 2*y + 3*z <= 4)
model.addCons(2*x + y - z >= 1)

# 设置目标函数
model.setObjective(x + y + z, sense="maximize")
model.includeHeurMydiving()
    
print("Available heuristics in SCIP:")
print("=" * 50)



# 求解
model.optimize()

# 获取结果
