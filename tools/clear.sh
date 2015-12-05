#!/usr/local/bin/zsh
for (( i=0; i<=30; i++ )); do
gpioctl $i 0
done
