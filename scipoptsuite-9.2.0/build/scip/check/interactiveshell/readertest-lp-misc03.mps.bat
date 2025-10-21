set heur emph off
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/scip"/check/"instances/MIP/misc03.mps"
write problem temp/misc03.mps.lp
presolve
write transproblem temp/misc03.mps_trans.lp
set heur emph def
read temp/misc03.mps_trans.lp
optimize
validatesolve "3360" "3360"
read temp/misc03.mps.lp
optimize
validatesolve "3360" "3360"
quit
