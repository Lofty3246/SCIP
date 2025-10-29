set display verblevel 0
set timing enabled FALSE
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip"/check/"instances/SAT/bart10.shuffled.cnf"
optimize
write statistics temp/bart10.shuffled.cnf_r1.stats
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0_bak/scip"/check/"instances/SAT/bart10.shuffled.cnf"
optimize
write statistics temp/bart10.shuffled.cnf_r2.stats
quit
