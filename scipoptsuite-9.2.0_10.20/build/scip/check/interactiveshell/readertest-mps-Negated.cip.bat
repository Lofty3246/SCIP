set heur emph off
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip"/check/"instances/MIP/Negated.cip"
write problem temp/Negated.cip.mps
presolve
write transproblem temp/Negated.cip_trans.mps
set heur emph def
read temp/Negated.cip_trans.mps
optimize
validatesolve "1" "1"
read temp/Negated.cip.mps
optimize
validatesolve "1" "1"
quit
