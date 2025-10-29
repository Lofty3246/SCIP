import pyscipopt as scip

model = scip.Model()
x = model.addVar("x", vtype="BINARY")
y = model.addVar("y", vtype="INTEGER")
z = model.addVar("z", vtype="CONTINUOUS")

model.hideOutput()
model.optimize()

for var in model.getVars():
    print(f"Var: {var.name}")
    
    # 方法1: vtype()
    if hasattr(var, 'vtype'):
        print(f"  vtype(): {var.vtype()}")
    else:
        print("  vtype(): ❌ not available")
    
    # 方法2: isBinary()
    if hasattr(var, 'isBinary'):
        print(f"  isBinary(): {var.isBinary()}")
    else:
        print("  isBinary(): ❌ not available")
    
    # 方法3: isInteger()
    if hasattr(var, 'isInteger'):
        print(f"  isInteger(): {var.isInteger()}")
    else:
        print("  isInteger(): ❌ not available")
    
    # 方法4: isContinuous()
    if hasattr(var, 'isContinuous'):
        print(f"  isContinuous(): {var.isContinuous()}")
    else:
        print("  isContinuous(): ❌ not available")
    
    # 方法5: isImplInt()
    if hasattr(var, 'isImplInt'):
        print(f"  isImplInt(): {var.isImplInt()}")
    else:
        print("  isImplInt(): ❌ not available")