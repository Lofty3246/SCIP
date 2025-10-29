set display verblevel 0
set timing enabled FALSE
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip"/check/"instances/MINLP/meanvarxsc.lp"
optimize
write statistics temp/meanvarxsc.lp_r1.stats
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip"/check/"instances/MINLP/meanvarxsc.lp"
optimize
write statistics temp/meanvarxsc.lp_r2.stats
quit
