set load "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/scip"/check/coverage/settings/"default".set
read "/home/lsy/Desktop/HUAWEI/scipoptsuite-9.2.0/scip"/check/"instances/Issue/3715.cip"
set limits objective "0.01"
optimize
validatesolve "0" "0"
quit
