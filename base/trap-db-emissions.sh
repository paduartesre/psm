#!/bin/bash
dir=/var/base 
while true;
do
sh $dir/get-file.sh
sleep 3m 
sh $dir/get-file.sh
done;   

