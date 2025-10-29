set heur emph off
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip"/check/"instances/MIP/gt2.mps"
write problem temp/gt2.mps.pip
presolve
write transproblem temp/gt2.mps_trans.pip
set heur emph def
read temp/gt2.mps_trans.pip
optimize
validatesolve "21166" "21166"
read temp/gt2.mps.pip
optimize
validatesolve "21166" "21166"
quit
