import numpy as np
import json
import random
import time
import os

from .eoh_interface_EC import InterfaceEC
# main class for eoh
class EOH:

    # initilization
    def __init__(self, paras, problem, select, manage, **kwargs):
        self.prob = problem
        self.select = select
        self.manage = manage

        # LLM settings
        self.use_local_llm = paras.llm_use_local
        self.llm_local_url = paras.llm_local_url
        self.api_endpoint = paras.llm_api_endpoint  # currently only API2D + GPT
        self.api_key = paras.llm_api_key
        self.llm_model = paras.llm_model

        # Experimental settings       
        self.pop_size = paras.ec_pop_size  # popopulation size, i.e., the number of algorithms in population
        self.n_pop = paras.ec_n_pop  # number of populations

        self.operators = paras.ec_operators
        self.operator_weights = paras.ec_operator_weights
        if paras.ec_m > self.pop_size or paras.ec_m == 1:
            print("m should not be larger than pop size or smaller than 2, adjust it to m=2")
            paras.ec_m = 2
        self.m = paras.ec_m

        self.debug_mode = paras.exp_debug_mode  # if debug
        self.ndelay = 1  # default

        self.use_seed = paras.exp_use_seed  # false
        self.seed_path = False # paras.exp_seed_path 
        self.load_pop = False # paras.exp_use_continue
        self.load_pop_path = paras.exp_continue_path
        self.load_pop_id = paras.exp_continue_id

        self.output_path = '/home/lsy/Desktop/HUAWEI/exp_scip/evalutation'

        self.exp_n_proc = paras.exp_n_proc
        
        self.timeout = paras.eva_timeout

        self.use_numba = paras.eva_numba_decorator

        print("- EoH parameters loaded -")

        # Set a random seed
        random.seed(2024)

    # add new individual to population
    def add2pop(self, population, offspring):
        for off in offspring:
            for ind in population:
                if ind['objective'] == off['objective']:
                    if (self.debug_mode):
                        print("duplicated result, retrying ... ")
            population.append(off)

    # run eoh 
    def run(self):

        print("- Evolution Start -")

        time_start = time.time()

        # interface for evaluation
        interface_prob = self.prob

        # interface for ec operators
        interface_ec = InterfaceEC(self.pop_size, self.m, self.api_endpoint, self.api_key, self.llm_model, self.use_local_llm, self.llm_local_url,
                                   self.debug_mode, interface_prob, select=self.select,n_p=self.exp_n_proc,
                                   timeout = self.timeout, use_numba=self.use_numba
                                   )

        # initialization
        population = []
        # 如果已经有了pop,则给pop打分,初始化默认是false
        if self.use_seed:
            with open(self.seed_path) as file:
                data = json.load(file)
            population = interface_ec.population_generation_seed(data,self.exp_n_proc)
            filename = self.output_path + "/results/population_generation_0.json"
            with open(filename, 'w') as f:
                json.dump(population, f, indent=5)
            n_start = 0
        else:
            # 没有pop,调用pop进行初始化,这里默认load pop为none
            if self.load_pop:  # load population from files
                print("load initial population from " + self.load_pop_path)
                with open(self.load_pop_path) as file:
                    data = json.load(file)
                # for individual in data:
                #     population.append(individual)  
                # 每次传入前，先对当前数据集进行打分筛选
                population = interface_ec.population_generation_seed(data,self.exp_n_proc)
                print("initial population has been loaded!")
                
                population = self.manage.population_management(population, 18)
                # 调用路径
                filename = '/home/lsy/Desktop/HUAWEI/EoH/examples/bp_online/evaluation/trainingdata/manage_score.json'
                with open(filename, 'w') as f:
                    json.dump(population, f, indent=5)
                    
                # with open('/home/lsy/Desktop/HUAWEI/EoH/examples/bp_online/evaluation/trainingdata/manage_score.json') as file:
                #     population = json.load(file)
                # print("manage_population=",len(population))
                
                n_start = self.load_pop_id
            # create new population
            else:  
                print("creating initial population:")
                ### 1
                population = interface_ec.population_generation('i1',[]) 
                population = self.manage.population_management(population, self.pop_size)
                print("manage_population=",len(population))

                # print(len(population))
                # if len(population)<self.pop_size:
                #     for op in [self.operators[0],self.operators[2]]:
                #         _,new_ind = interface_ec.get_algorithm(population, op)
                #         self.add2pop(population, new_ind)
                #         population = self.manage.population_management(population, self.pop_size)
                #         if len(population) >= self.pop_size:
                #             break
                #         print(len(population))
     
                
                print(f"Pop initial: ")

                for off in population:
                    print(" Obj: ", off['objective'], end="|")
                print()
                print("initial population has been created!")
                
                # Save intial population to a file
                filename = self.output_path + "/results/population_generation_0.json"
                with open(filename, 'w') as f:
                    json.dump(population, f, indent=5)
                n_start = 0

        # main loop
        n_op = len(self.operators)
        # if self.method == 'eoh':
        #     self.ec_operators  = ['e1','e2','m1','m2']
        # 第一层循环表示要迭代的generation
        for pop in range(n_start, self.n_pop):  
            print(f"----------generation_{pop}-----------")
            # 第二层循环表示每一个generation,需要经过几个operator  
            for i in range(n_op):
                op = self.operators[i]
                print(op)
                print(f" OP: {op}, [{i + 1} / {n_op}] ", end="|") 
                op_w = self.operator_weights[i]
                if (np.random.rand() < op_w):
                    parents, offsprings = interface_ec.get_algorithm(population, op)
                    self.add2pop(population, offsprings)  # Check duplication, and add the new offspring
                    print("len(offspring)=",len(offsprings))
                    print("len(population)=",len(population))
                    for off in offsprings:
                        print(" Obj: ", off['objective'], end="|")
                    print("\n")
                # 直接将新生成的后代加入pop,如果效果好则会保留，效果不好会被后续manage剔除
              
                size_act = min(len(population), self.pop_size)
                population = self.manage.population_management(population, size_act)


            # 保存路径
            filename = self.output_path + "/results"+"/pops"+"/population_generation_" + str(pop + 1) + ".json"
            with open(filename, 'w') as f:
                json.dump(population, f, indent=5)

       
            # filename = self.output_path + "/results"+"/pops_best"+"/population_generation_" + str(pop + 1) + ".json"
            # with open(filename, 'w') as f:
            #     json.dump(population[0], f, indent=5)
                
            print(f"--- {pop + 1} of {self.n_pop} populations finished. Time Cost:  {((time.time()-time_start)/60):.1f} m")
            print("Pop Objs: ", end=" ")
            for i in range(len(population)):
                print(str(population[i]['objective']) + " ", end="")
            print("\n")

