class GetPrompts():
    def __init__(self):
        self.prompt_task = " You are a Coder Designer. Hello and welcome to the program. Read the prompt content, propose your algorithm ideas, and provide detail implementation procedure, similar to the role of a project manager. \
            The topic is stated as follows:Diving heuristics are one of the most important categories of primal heuristics in SCIP framework for Mixed Integer Linear Programming (MILP) problem. \
            It starts from the current LP solution and iteratively fix an integer variable to an integral value and resolve the LP. You should create a totally new Python scoring function for me (different from the heuristics in the literature) to choose the fractional variable and corresponding rounding direction using the information of the LP relaxation and objective function. \
            The function is used for every variable to decide the variable’s score and rounding direction. Specifically, you have these features to use in the score function: "
        self.prompt_func_name = "myheurdiving_helper"
        self.prompt_func_inputs = ['mayrounddown', 'mayroundup', 'candsfrac', 'candsol', 'nlocksdown', 'nlocksup', 'obj', 'objnorm', 'pscostdown', 'pscostup', 'rootsolval', 'nNonz', 'isBinary']
        self.prompt_func_outputs = ['score','roundup']
        self.prompt_inout_inf = "\
            \"mayrounddown\" and \"mayroundup\" (bool, indicate whether it is possible to round variable down/up and stay feasible, it should be penalized because we need more exploration); \
            \"candsfrac\" (float, fractional part of solution value of variable); \
            \"candsol\" (float, solution value of variable in LP relaxation solution); \
            \"nlocksdown\" and \"nlocksup\" (int, the number of locks for rounding down/up of a special type); \
            \"obj\" (float, objective function value of variable); \
            \"objnorm\" (float, the Euclidean norm of the objective function vector); \
            \"pscostdown\" and \"pscostup\" (float, the variable’s pseudo cost value for the given change of the variable’s LP value); \
            \"rootsolval\" (float, the solution of the variable in the last root node’s relaxation, if the root relaxation is not yet completely solved, zero is returned); \
            \"nNonz\" (int, the number of nonzero entries in variable);\
            \"isBinary\" (bool, TRUE if the variable is of binary type)." 
        self.prompt_other_inf = "The description must start with ’<start_des>’ and end with ’</end_des>’. The code must start with ’<start_code>’ and end with ’</end_code>’. The code score function must call ’myheurdiving’ that takes 13 inputs ’mayrounddown’, ’mayroundup’, ’candsfrac’, ’candsol’, ’nlocksdown’, ’nlocksup’, ’obj’, ’objnorm’, ’pscostdown’, ’pscostup’, ’rootsolval’, ’nNonz’, and ’isBinary’. The function must output the ’score’ and ’roundup’, and must return two outputs:'score','roundup',where ’score’ is a float type indicating the variable’s score, the more the better, and the ’roundup’ is a bool type indicating whether we should round the variable up, True for rounding up. Be creative and do not give additional explanations."
#Include the following imports at the beginning of the code: 'import numpy as np', and 'from numba import jit'. Place '@jit(nopython=True)' just above the 'priority' function definition."

    def get_task(self):
        return self.prompt_task
    
    def get_func_name(self):
        return self.prompt_func_name
    
    def get_func_inputs(self):
        return self.prompt_func_inputs
    
    def get_func_outputs(self):
        return self.prompt_func_outputs
    
    def get_inout_inf(self):
        return self.prompt_inout_inf

    def get_other_inf(self):
        return self.prompt_other_inf

