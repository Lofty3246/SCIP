# from machinelearning import *
# from mathematics import *
# from optimization import *
# from physics import *
import sys
sys.path.append('/home/lsy/Desktop/HUAWEI')

class Probs():
    def __init__(self,paras):

        if not isinstance(paras.problem, str):
            self.prob = paras.problem
            print("- Prob local loaded ")
        elif paras.problem == "tsp_construct":
            from .optimization.tsp_greedy import run
            self.prob = run.TSPCONST()
            print("- Prob "+paras.problem+" loaded ")
        elif paras.problem == "bp_online":
            from .optimization.bp_online import run
            self.prob = run.BPONLINE()
            print("- Prob "+paras.problem+" loaded ")
        elif paras.problem == "diving":
            from exp_scip.diving import run
            self.prob = run.DIVING()
            print("- Prob "+paras.problem+" loaded ")
        else:
            print("problem "+paras.problem+" not found!")


    def get_problem(self):

        return self.prob
