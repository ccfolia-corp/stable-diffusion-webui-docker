#!/bin/bash
URL="http://localhost:8887/generate?prompt=forest&width=768&height=512"
echo "URL: ${URL}"
time (
exec {o1}< <(curl ${URL} -o /dev/null -s -w "%{time_total}s\n")
exec {o2}< <(curl ${URL} -o /dev/null -s -w "%{time_total}s\n")
exec {o3}< <(curl ${URL} -o /dev/null -s -w "%{time_total}s\n")
exec {o4}< <(curl ${URL} -o /dev/null -s -w "%{time_total}s\n")
exec {o5}< <(curl ${URL} -o /dev/null -s -w "%{time_total}s\n")
exec {o6}< <(curl ${URL} -o /dev/null -s -w "%{time_total}s\n")
exec {o7}< <(curl ${URL} -o /dev/null -s -w "%{time_total}s\n")
exec {o8}< <(curl ${URL} -o /dev/null -s -w "%{time_total}s\n")
exec {o9}< <(curl ${URL} -o /dev/null -s -w "%{time_total}s\n")
exec {o10}< <(curl ${URL} -o /dev/null -s -w "%{time_total}s\n")
arr1[0]=$(cat <&${o1})
arr1[1]=$(cat <&${o2})
arr1[2]=$(cat <&${o3})
arr1[3]=$(cat <&${o4})
arr1[4]=$(cat <&${o5})
arr1[5]=$(cat <&${o6})
arr1[6]=$(cat <&${o7})
arr1[7]=$(cat <&${o8})
arr1[8]=$(cat <&${o9})
arr1[9]=$(cat <&${o10})
arr2=($(for v in "${arr1[@]}"; do echo "$v"; done|sort -n))
for i in ${arr2[@]};do echo $i;done
)