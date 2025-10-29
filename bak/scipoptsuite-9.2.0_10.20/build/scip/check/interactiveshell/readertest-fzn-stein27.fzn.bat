set heur emph off
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip"/check/"instances/MIP/stein27.fzn"
write problem temp/stein27.fzn.fzn
presolve
write transproblem temp/stein27.fzn_trans.fzn
set heur emph def
read temp/stein27.fzn_trans.fzn
optimize
validatesolve "18" "18"
read temp/stein27.fzn.fzn
optimize
validatesolve "18" "18"
quit
