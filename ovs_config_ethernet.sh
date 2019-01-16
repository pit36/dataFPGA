#!/bin/bash
USER=$1
IF1=$2
IF2=$3
bash /home/$USER/vw-multi-connectivity/testbed/ovs/utilities/ovs-ctl start
NUMBER=$(echo "$USER" | cut -c 3)
ovs-vsctl del-br s$NUMBER
ovs-vsctl add-br s$NUMBER
ovs-vsctl set bridge s$NUMBER other-config:datapath-id=000000000000000$NUMBER
ovs-vsctl get bridge s$NUMBER other-config:datapath-id
ovs-vsctl set-controller s$NUMBER tcp:127.0.0.1:6653
ovs-vsctl set-manager ptcp:6632
ifconfig s$NUMBER 10.0.0.$NUMBER
ovs-vsctl add-port s$NUMBER $IF1
ovs-vsctl add-port s$NUMBER $IF2
#tunctl -t dummy4
#tunctl -t dummy2
#ovs-vsctl add-bond s$NUMBER b4 enp4s0 dummy4 other_config:miimon-interval=1
#ovs-vsctl add-bond s$NUMBER b2 enp2s0 dummy2 other_config:miimon-interval=1
#sudo ovs-vsctl -- set Interface enp4s0 ofport_request=1
#sudo ovs-vsctl -- set Interface enp2s0 ofport_request=2
#ifconfig dummy4 down
#ifconfig dummy2 down
ifconfig s$NUMBER up
