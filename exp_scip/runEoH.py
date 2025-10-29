import sys
sys.path.append('/home/lsy/Desktop/HUAWEI/EoH')
sys.path.append('/home/lsy/Desktop/HUAWEI/EoH/eoh')

from eoh.src.eoh import eoh
from eoh.src.eoh.utils.getParas import Paras

# Parameter initilization #
paras = Paras() 

# Set parameters #
paras.set_paras(method = "eoh",    # ['ael','eoh']
                problem = "diving", #['tsp_construct','bp_online']
                llm_api_endpoint = "api.zhizengzeng.com", # set your LLM endpoint
                llm_api_key = "sk-zk25aedc78a7301db757272abfb46328e8e6778ecd35fd61",   # set your key
                llm_model = "gpt-4o-mini",
                ec_pop_size = 4, # number of samples in each population
                ec_n_pop = 4,  # number of populations
                exp_n_proc = 4,  # multi-core parallel
                # ec_m = 5,
                exp_debug_mode = False)
# print(paras.ec_n_pop)
# print(paras.ec_pop_size)


# initilization
evolution = eoh.EVOL(paras)

# run 
evolution.run()