set heur emph off
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip"/check/"instances/MIP/stein27_inf.lp"
write problem temp/stein27_inf.lp.rlp
presolve
write transproblem temp/stein27_inf.lp_trans.rlp
set heur emph def
read temp/stein27_inf.lp_trans.rlp
optimize
validatesolve "+infinity" "+infinity"
read temp/stein27_inf.lp.rlp
optimize
validatesolve "+infinity" "+infinity"
quit
