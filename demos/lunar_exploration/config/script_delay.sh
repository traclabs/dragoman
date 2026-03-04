#!/bin/bash

# Script to simulate time delay between 2 docker containers
# Example: You have a demo with N containers, you want to simulate a delay in
# communication between containers "ground" and "flight"of 1second
# In the ground container: Run this script: ./script_delay.sh FLIGHT_IP 500
# In the flight container: Run this script: ./script_delay.sh GROUND_IP 500
# First argument is the IP w.r.t. which you want to simulate delay,
# Second argument should be half of the delay you want in communicating one-way
# (so, for a 1 second delay, you have 1second=1000ms/2 = 500ms
OTHER_IP_ADDRESS="$1"
MS="$2"

echo "Delayed IP: ${OTHER_IP_ADDRESS}"
echo "Time: ${MS}"
sudo tc qdisc add dev eth0 root handle 1: htb
sudo tc class add dev eth0 parent 1: classid 1:1 htb rate 1000mbit
sudo tc qdisc add dev eth0 parent 1:1 handle 10: netem delay ${MS}ms
sudo tc filter add dev eth0 protocol ip parent 1:0 prio 1 u32 match ip dst $OTHER_IP_ADDRESS/32 flowid 1:1

