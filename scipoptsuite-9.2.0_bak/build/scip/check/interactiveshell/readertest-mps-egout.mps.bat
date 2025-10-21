set heur emph off
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip"/check/"instances/MIP/egout.mps"
write problem temp/egout.mps.mps
presolve
write transproblem temp/egout.mps_trans.mps
set heur emph def
read temp/egout.mps_trans.mps
optimize
validatesolve "568.1007" "568.1007"
read temp/egout.mps.mps
optimize
validatesolve "568.1007" "568.1007"
quit
