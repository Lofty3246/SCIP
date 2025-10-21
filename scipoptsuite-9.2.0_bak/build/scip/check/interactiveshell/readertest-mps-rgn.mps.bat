set heur emph off
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip"/check/"instances/MIP/rgn.mps"
write problem temp/rgn.mps.mps
presolve
write transproblem temp/rgn.mps_trans.mps
set heur emph def
read temp/rgn.mps_trans.mps
optimize
validatesolve "82.19999924" "82.19999924"
read temp/rgn.mps.mps
optimize
validatesolve "82.19999924" "82.19999924"
quit
