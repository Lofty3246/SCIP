set heur emph off
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip"/check/"instances/MIP/MANN_a9.clq.lp"
write problem temp/MANN_a9.clq.lp.fzn
presolve
write transproblem temp/MANN_a9.clq.lp_trans.fzn
set heur emph def
read temp/MANN_a9.clq.lp_trans.fzn
optimize
validatesolve "16" "16"
read temp/MANN_a9.clq.lp.fzn
optimize
validatesolve "16" "16"
quit
