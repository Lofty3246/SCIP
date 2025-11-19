import numpy as np
import time
from .eoh_evolution_origin import Evolution
from concurrent.futures import ProcessPoolExecutor, TimeoutError
import warnings
from joblib import Parallel, delayed
from .evaluator_accelerate import add_numba_decorator
import re
import concurrent.futures
import json

class InterfaceEC():
    def __init__(self, pop_size, m, api_endpoint, api_key, llm_model,llm_use_local,llm_local_url, debug_mode, interface_prob, select,n_p,timeout,use_numba,**kwargs):
        ''' (num) m :num_parant selection
            (实例) interface_prob: self.prob = run.BPONLINE()
            (py) select:self.select = prob_rank
            
        '''
        # LLM settings
        self.pop_size = pop_size
        self.interface_eval = interface_prob
        prompts = interface_prob.prompts
        self.evol = Evolution(api_endpoint, api_key, llm_model,llm_use_local,llm_local_url, debug_mode,prompts, **kwargs)
        self.m = m
        self.debug = debug_mode

        if not self.debug:
            warnings.filterwarnings("ignore")

        self.select = select
        self.n_p = n_p
        
        self.timeout = timeout
        self.use_numba = use_numba
        
    def code2file(self,code):
        with open("./ael_alg.py", "w") as file:
        # Write the code to the file
            file.write(code)
        return 
    
    def add2pop(self,population,offspring):
        for ind in population:
            if ind['objective'] == offspring['objective']:
                if self.debug:
                    print("duplicated result, retrying ... ")
                return False
        population.append(offspring)
        return True
    
    def check_duplicate(self,population,code):
        for ind in population:
            if code == ind['code']:
                print("duplicate found")
                return True
        return False
    
    # # pop_greedy
    # def population_management(self,pop):
    #     # Delete the worst individual
    #     pop_new = heapq.nsmallest(self.pop_size, pop, key=lambda x: x['objective'])
    #     return pop_new
    # # prob_rank
    # def parent_selection(self,pop,m):
    #     ranks = [i for i in range(len(pop))]
    #     probs = [1 / (rank + 1 + len(pop)) for rank in ranks]
    #     parents = random.choices(pop, weights=probs, k=m)
    #     return parents
    
    
    # 给种群中的个体评分 fitness score
    def population_generation_seed(self,seeds,n_p):

        population = []

        fitness = Parallel(n_jobs=n_p)(delayed(self.interface_eval.evaluate)(seed['code']) for seed in seeds)

        for i in range(len(seeds)):
            try:
                seed_alg = {
                    'algorithm': seeds[i]['algorithm'],
                    'code': seeds[i]['code'],
                    'objective': None,
                    'other_inf': None
                }

                obj = np.array(fitness[i])
                seed_alg['objective'] = np.round(obj, 5)
                population.append(seed_alg)

            except Exception as e:
                print("Error in seed algorithm")
                import traceback
                traceback.print_exc()
                exit()

        print("Initiliazation finished! Get "+str(len(seeds))+" seed algorithms")

        return population
    
    def population_generation(self,opeator,population = [] ):
        
        # num_indiv = n_create * pop_size
        n_create = 3
        for i in range(n_create):
            # 这里的并行次数由pop_size决定
            print("n_try=",i)
            _,pop = self.get_algorithm(population,opeator)
            for p in pop:
                population.append(p)
        # 生成足够多的pop_indiv，后续再通过manage管理数量
            print("population=",len(population))
            if len(population) >= self.pop_size*2:
                print("break here")
                break
        print("return here")
        return population
    
   # 下面三个get函数，从上到下，逐级调用

    # 调用get_offspring
    def get_algorithm(self, pop, operator):
        start = time.time()
        results = []
        try:
            timeout = self.timeout + 420
            print("timeout=",timeout)
            results = Parallel(n_jobs=self.n_p,timeout=timeout)(delayed(self.get_offspring)(pop, operator) for _ in range(self.pop_size))   
            t1 = time.time()
            print("\n")
            print(f"get_algorithm spend: {t1 - start} seconds")        
        except Exception as e:
            t2 = time.time()
            print("\n")
            print("this is  get_algorithm Error:")
            print(f"get_algorithm fail time: {t2 - start} seconds")
            if self.debug:
                print(f"Error: {e}")
            import traceback
            traceback.print_exc()
            print("Parallel time out .")
            
        time.sleep(2)
        
        out_p = []
        out_off = []
        for p, off in results:
            out_p.append(p)
            out_off.append(off)
            if self.debug:
                print(f">>> check offsprings: \n {off}")
        return out_p, out_off
    
    # 调用get_alg
    def get_offspring(self, pop, operator):
        start = time.time()
        try:
            p, offspring = self._get_alg(pop, operator)
            t1 = time.time() 
            # print("\n")
            # print(f"get offspring spend: {t1 - start} seconds")
            if self.use_numba:
                
                # Regular expression pattern to match function definitions
                pattern = r"def\s+(\w+)\s*\(.*\):"

                # Search for function definitions in the code
                match = re.search(pattern, offspring['code'])

                function_name = match.group(1)

                code = add_numba_decorator(program=offspring['code'], function_name=function_name)
                t2 = time.time()
                print(f"add numba spend: {t2 - start} seconds")
            else:
                code = offspring['code']
                algorithm = offspring['algorithm']

            n_retry= 1
            while self.check_duplicate(pop, offspring['code']):
                print('try again')
                n_retry += 1
                if self.debug:
                    print("duplicated code, wait 1 second and retrying ... ")
                    
                p, offspring = self._get_alg(pop, operator)

                if self.use_numba:
                    # Regular expression pattern to match function definitions
                    pattern = r"def\s+(\w+)\s*\(.*\):"

                    # Search for function definitions in the code
                    match = re.search(pattern, offspring['code'])

                    function_name = match.group(1)

                    code = add_numba_decorator(program=offspring['code'], function_name=function_name)
                else:
                    code = offspring['code']
                    
                if n_retry > 1:
                    break
            
            try:
                with ProcessPoolExecutor() as executor:
                    future = executor.submit(self.interface_eval.evaluate, code)
                    fitness = future.result(timeout=self.timeout+15)  # 真正有效的超时
                    t2 = time.time()
                    print(f"get offspring eval: {t2 - start:.2f}s")
                    offspring['objective'] = np.round(fitness, 5)
            except TimeoutError:
                t2 = time.time()
                print(f"Eval timeout after {t2 - start:.2f}s")
                offspring = {
                'algorithm': algorithm,
                'code': code,
                'objective': None,
                'other_inf': None
                }
                p = None
                executor.shutdown(wait=False)
                return p, offspring
            except Exception as e:
                print(f"Eval error: {e}")
                offspring = {
                'algorithm': algorithm,
                'code': code,
                'objective': None,
                'other_inf': None
                }
                p = None
                return p, offspring

                        
            #self.code2file(offspring['code'])
            # with concurrent.futures.ThreadPoolExecutor() as executor:
            #     future = executor.submit(self.interface_eval.evaluate, code)
            #     fitness = future.result(timeout=self.timeout+15)
            #     t2 = time.time()
            #     print(f"get offspring eval:{t2 - start} seconds")
            #     offspring['objective'] = np.round(fitness, 5)
            #     future.cancel()        
                # fitness = self.interface_eval.evaluate(code)
                

        except Exception as e:
            t2 = time.time()
            print("\n")
            print(f"get offspring fail time----from start: {t2 - start} seconds")

            offspring = {
                'algorithm': None,
                'code': None,
                'objective': None,
                'other_inf': None
            }
            p = None
            import traceback
            traceback.print_exc()
        # Round the objective values
            print("This offspring is none")
        return p, offspring
    
    # 传入现有pop和所选operator,从pop父代中选取m个indiv，获取选取的parent,以及后代fspring[code,algorithm]
    def _get_alg(self,pop,operator):
        print("get_alg start")
        # define offspring
        offspring = {
            'algorithm': None,
            'code': None,
            'objective': None,
            'other_inf': None
        }
        if operator == "i1":
            parents = None
            [offspring['code'],offspring['algorithm']] =  self.evol.i1()            
        elif operator == "e1":
            parents = self.select.parent_selection(pop,self.m)
            [offspring['code'],offspring['algorithm']] = self.evol.e1(parents)
        elif operator == "e2":
            parents = self.select.parent_selection(pop,self.m)
            [offspring['code'],offspring['algorithm']] = self.evol.e2(parents) 
        elif operator == "m1":
            parents = self.select.parent_selection(pop,1)
            [offspring['code'],offspring['algorithm']] = self.evol.m1(parents[0])   
        elif operator == "m2":
            parents = self.select.parent_selection(pop,1)
            [offspring['code'],offspring['algorithm']] = self.evol.m2(parents[0]) 
        elif operator == "m3":
            parents = self.select.parent_selection(pop,1)
            [offspring['code'],offspring['algorithm']] = self.evol.m3(parents[0]) 
        else:
            print(f"Evolution operator [{operator}] has not been implemented ! \n") 
            parents = None
        # print("algorithm=",offspring['algorithm'])
        return parents, offspring

    
    ''' # def process_task(self,pop, operator):
    #     result =  None, {
    #             'algorithm': None,
    #             'code': None,
    #             'objective': None,
    #             'other_inf': None
    #         }
    #     with concurrent.futures.ThreadPoolExecutor() as executor:
    #         future = executor.submit(self.get_offspring, pop, operator)
    #         try:
    #             result = future.result(timeout=self.timeout)
    #             future.cancel()
    #             #print(result)
    #         except:
    #             future.cancel()
                
    #     return result
    '''

    ''' # def get_algorithm(self,pop,operator, pop_size, n_p):
        
    #     # perform it pop_size times with n_p processes in parallel
    #     p,offspring = self._get_alg(pop,operator)
    #     while self.check_duplicate(pop,offspring['code']):
    #         if self.debug:
    #             print("duplicated code, wait 1 second and retrying ... ")
    #         time.sleep(1)
    #         p,offspring = self._get_alg(pop,operator)
    #     self.code2file(offspring['code'])
    #     try:
    #         fitness= self.interface_eval.evaluate()
    #     except:
    #         fitness = None
    #     offspring['objective'] =  fitness
    #     #offspring['other_inf'] =  first_gap
    #     while (fitness == None):
    #         if self.debug:
    #             print("warning! error code, retrying ... ")
    #         p,offspring = self._get_alg(pop,operator)
    #         while self.check_duplicate(pop,offspring['code']):
    #             if self.debug:
    #                 print("duplicated code, wait 1 second and retrying ... ")
    #             time.sleep(1)
    #             p,offspring = self._get_alg(pop,operator)
    #         self.code2file(offspring['code'])
    #         try:
    #             fitness= self.interface_eval.evaluate()
    #         except:
    #             fitness = None
    #         offspring['objective'] =  fitness
    #         #offspring['other_inf'] =  first_gap
    #     offspring['objective'] = np.round(offspring['objective'],5) 
    #     #offspring['other_inf'] = np.round(offspring['other_inf'],3)
    #     return p,offspring
    '''
