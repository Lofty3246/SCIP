import json
def myheurdiving_helper(mayrounddown, mayroundup, candsfrac, candsol, nlocksdown, nlocksup, obj, objnorm, pscostdown, pscostup, rootsolval, nNonz, isBinary):   
    try:
        path = "/home/lsy/Desktop/HUAWEI/exp_scip/diving.py"
        with open(path, 'r') as file:
            contents = file.read()

        function_dict = {}
        exec(contents, function_dict)

        myheurdiving = function_dict['myheurdiving']
        score, roundup = myheurdiving(mayrounddown, mayroundup, candsfrac, candsol, nlocksdown, nlocksup, obj, objnorm, pscostdown, pscostup, rootsolval, nNonz, isBinary)
        assert((type(score) == float) or (type(score) == int))
        assert( (type(roundup) == bool) or (type(roundup) == int) )
        return score, roundup
    except Exception as e:
        # set the state to decide whether the heur is executable or not, it is init in /home/yyzhou/LLM4Heur/LLMandEA/eval.py
        state = {
            "heur_executable": False,
            "error": str(e)
        }
        with open('/home/optv/workspace/zzh/LLM-refer/AlgorithmDiscovery/EA/tmp/state.json', 'w') as f:
            json.dump(state, f, indent=4)
        return 0, 1