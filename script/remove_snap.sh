#!/bin/bash

sum=$(snap list | awk 'NR>=2{print $1}' | wc -l)
while [ $sum -ne 0 ];do
    for p in $(snap list | awk 'NR>=2{print $1}'); do
        snap remove --purge $p
    done
    sum=$(snap list | awk 'NR>=2{print $1}' | wc -l) 
done

apt -y autoremove --purge snapd
