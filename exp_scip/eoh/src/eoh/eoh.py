
import random

from .utils import createFolders
from .methods import methods
from .problems import problems

# main class for AEL
class EVOL:

    # initilization
    def __init__(self, paras, prob=None, **kwargs):

        print("----------------------------------------- ")
        print("---              Start EoH            ---")
        print("-----------------------------------------")
        # Create folder #
        createFolders.create_folders(paras.exp_output_path)
        print("- output folder created -")

        self.paras = paras

        print("-  parameters loaded -")

        # 这个有任何用吗？类里面只定义了，没有后续了呀
        self.prob = prob

        # Set a random seed
        random.seed(2024)

        
    # run methods
    def run(self):

        problemGenerator = problems.Probs(self.paras)

        problem = problemGenerator.get_problem()

        methodGenerator = methods.Methods(self.paras,problem)
        
        # 返回EOH的实例
        method = methodGenerator.get_method()

        method.run()

        print("> End of Evolution! ")
        print("----------------------------------------- ")
        print("---     EoH successfully finished !   ---")
        print("-----------------------------------------")
