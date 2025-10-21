set heur emph off
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/scip"/check/"instances/MIP/egout.mps"
write problem temp/egout.mps.pip
presolve
write transproblem temp/egout.mps_trans.pip
set heur emph def
read temp/egout.mps_trans.pip
optimize
validatesolve "568.1007" "568.1007"
read temp/egout.mps.pip
optimize
validatesolve "568.1007" "568.1007"
quit
