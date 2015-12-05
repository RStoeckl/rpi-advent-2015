#!/usr/local/bin/zsh

pins_in=(17 27 22)
pins_out=(18 23 24)

for pin in $pins_in; do
gpioctl -c $pin in
done

for pin in $pins_out; do
gpioctl -c $pin out
done

while true; do
for i in 1 2 3; do
pin_stat=$(gpioctl $pins_in[$i])
echo $i hat $pin_stat
pin_stat=$(($pin_stat-1))
pin_stat=$(($pin_stat*(-1)))
gpioctl $pins_out[$i] $pin_stat
done
done
