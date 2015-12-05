#!/usr/local/bin/zsh

tools/clear.sh

interval=0.5
declare -a pins=(18 23 24)
phasen_farbe=(18 23 18 23 24 24 24 24 24 24 24 24 24 24 23 23)
phasen_status=(1  1  0  0  1  0  1  0  1  0  1  0  1  0  1  0)
phasen_zeit=(  7  3  0  0  7  1  1  1  1  1  1  1  1  1  3  0)

for i in $pins; do
gpioctl -c $i OUT
done

length=${#phasen_farbe[@]}

while true; do
for (( i=1; i<=${length}; i++ )); do
echo $phasen_farbe[$i] $phasen_status[$i]
gpioctl $phasen_farbe[$i] $phasen_status[$i]
sleep $(($interval * phasen_zeit[$i]))
done
done



