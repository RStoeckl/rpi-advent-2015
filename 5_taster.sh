#!/usr/local/bin/zsh
pins_out=(18)
pins_in=(24)

for pin in $pins_out; do
gpioctl -c $pin OUT
done

for pin in $pins_in; do
gpioctl -c $pin IN
done

tools/clear.sh

laststate=0

while true; do
state=$(gpioctl $pins_in[1])
if [ $state -eq 1 ] && [ $laststate -lt 1 ]; then
gpioctl -t $pins_out[1]
fi
laststate=$(gpioctl $pins_in[1])
done
