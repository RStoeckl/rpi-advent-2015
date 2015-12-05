#!/usr/local/bin/zsh
tools/clear.sh

pin_in=25
pin_out=18
pin_red=24

gpioctl -c $pin_in in
gpioctl -c $pin_out out
gpioctl -c $pin_red out

while true; do
pinstatus=$(gpioctl $pin_in)
pinredstatus=$pinstatus
pinstatus=$(($pinstatus-1))
pinstatus=$(($pinstatus*(-1)))
gpioctl $pin_out $pinstatus
gpioctl $pin_red $pinredstatus
sleep 0.2
done
