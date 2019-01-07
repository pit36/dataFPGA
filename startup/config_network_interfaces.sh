modprobe sume_riffa
# set interfaces up, normally are up but to be sure lol
ip link set dev nf0 up
ip link set dev nf1 up
ip link set dev nf2 up
ip link set dev nf3 up
# add to bonds
ovs-vsctl add-br br0
ovs-vsctl add-bond br0 bond0 nf0 nf1
ovs-vsctl add-bond br0 bond1 nf2 nf3
