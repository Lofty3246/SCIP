set display verblevel 0
set timing enabled FALSE
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/scip"/check/"instances/MINLP/circle.lp"
optimize
write statistics temp/circle.lp_r1.stats
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/scip"/check/"instances/MINLP/circle.lp"
optimize
write statistics temp/circle.lp_r2.stats
quit
