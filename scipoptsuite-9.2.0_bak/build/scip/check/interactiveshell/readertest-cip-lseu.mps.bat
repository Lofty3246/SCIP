set heur emph off
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip"/check/"instances/MIP/lseu.mps"
write problem temp/lseu.mps.cip
presolve
write transproblem temp/lseu.mps_trans.cip
set heur emph def
read temp/lseu.mps_trans.cip
optimize
validatesolve "1120" "1120"
read temp/lseu.mps.cip
optimize
validatesolve "1120" "1120"
quit
