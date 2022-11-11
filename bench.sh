#!/bin/bash
URL="http://localhost:8887/generate?prompt=forest&width=768&height=512"
N=10
sum_time=0
echo "URL: ${URL}"
for i in $(seq ${N});do
sleep 1
start_time=`date +%s%3N`
curl ${URL} -o /dev/null -s
end_time=`date +%s%3N`
run_time=$((end_time - start_time))
sum_time=$((sum_time + run_time))
echo "${i} end ${run_time}ms"
done
echo "all ${sum_time}ms"