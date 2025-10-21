set heur emph off
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip"/check/"instances/MIP/stein27.fzn"
write problem temp/stein27.fzn.mps
presolve
write transproblem temp/stein27.fzn_trans.mps
set heur emph def
read temp/stein27.fzn_trans.mps
optimize
validatesolve "18" "18"
read temp/stein27.fzn.mps
optimize
validatesolve "18" "18"
quit
