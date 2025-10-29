set display verblevel 0
set timing enabled FALSE
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip"/check/"instances/MINLP/m3.osil"
optimize
write statistics temp/m3.osil_r1.stats
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip"/check/"instances/MINLP/m3.osil"
optimize
write statistics temp/m3.osil_r2.stats
quit
