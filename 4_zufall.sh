#!/usr/local/bin/zsh

pins=(18 23 24)
on_off=(0 0 0)


#iterator=0
while true; do
baum=$((($RANDOM/32765.0)*3))
baum=$(echo $baum | head -c 1)
pin=$pins[$(($baum+1))]
pinstatus=$(($RANDOM%2))

sum=0
for i in $pins; do
sum=$(($sum+on_off[$i]))
done
min=2
if [ "$sum" -lt "$min" ]; then
pinstatus=1
fi
max=3
if [ "$sum" -eq "$max" ]; then
pinstatus=0
fi

on_off[$pin]=$pinstatus

gpioctl $pin $pinstatus
#iterator=$(($iterator+1))
sleep $((($RANDOM/32765.0)))
done
