#!/bin/bash
# load driver
modprobe sume_riffa
sleep 0.005m
# set interfaces up
ip link set dev nf0 up
ip link set dev nf1 up
ip link set dev nf2 up
ip link set dev nf3 up
#  start ovs
export PATH=$PATH:/usr/local/share/openvswitch/scripts
ovs-ctl start
sleep 0.005m
# set brige up
ip link set dev br0 up
# give bridge IP (vw1)
ip addr add 10.0.1.10/24 dev br0
