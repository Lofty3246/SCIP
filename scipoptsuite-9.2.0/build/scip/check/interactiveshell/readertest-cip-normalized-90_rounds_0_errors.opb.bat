set heur emph off
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/scip"/check/"instances/PseudoBoolean/normalized-90_rounds_0_errors.opb"
write problem temp/normalized-90_rounds_0_errors.opb.cip
presolve
write transproblem temp/normalized-90_rounds_0_errors.opb_trans.cip
set heur emph def
read temp/normalized-90_rounds_0_errors.opb_trans.cip
optimize
validatesolve "0" "0"
read temp/normalized-90_rounds_0_errors.opb.cip
optimize
validatesolve "0" "0"
quit
