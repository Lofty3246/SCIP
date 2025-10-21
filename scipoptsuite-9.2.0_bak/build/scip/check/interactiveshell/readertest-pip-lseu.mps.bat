set heur emph off
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip"/check/"instances/MIP/lseu.mps"
write problem temp/lseu.mps.pip
presolve
write transproblem temp/lseu.mps_trans.pip
set heur emph def
read temp/lseu.mps_trans.pip
optimize
validatesolve "1120" "1120"
read temp/lseu.mps.pip
optimize
validatesolve "1120" "1120"
quit
