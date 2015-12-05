#!/usr/local/bin/zsh
tools/clear.sh

pin_in=25
pin_out=18

gpioctl -c $pin_in in
gpioctl -c $pin_out out

while true; do
pinstatus=$(gpioctl $pin_in)
pinstatus=$(($pinstatus-1))
pinstatus=$(($pinstatus*(-1)))
gpioctl $pin_out $pinstatus
sleep 0.2
done
