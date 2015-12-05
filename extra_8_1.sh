#!/usr/local/bin/zsh
pins_out=(18 23 24)
pin_in=17

tools/clear.sh

for pin in $pins_out; do
gpioctl -c $pin out
done

gpioctl -c $pin_in in

i=1
last_state=1

while true; do

#echo $i

current_state=$(gpioctl $pin_in)
#echo curr $current_state
#echo last $last_state
if [ $last_state -eq 1 ] && [ $current_state -eq 0 ]; then
calc=$i
for i2 in 1 2 3; do
gpioctl $pins_out[$i2] $((calc%2))
calc=$(($calc/2))
done

#i=$((i+1))
i=$RANDOM
i=$((i%8))
if [ $i -eq 0 ]; then
i=1
fi
fi
last_state=$current_state
done
