modprobe sume_riffa
# set interfaces up, normally are up but to be sure lol
sudo ip link set dev nf0 up
sudo ip link set dev nf1 up
sudo ip link set dev nf2 up
sudo ip link set dev nf3 up
# add to bonds
sudo ovs-vsctl add-bond br0 bond0 nf0 nf1
sudo ovs-vsctl add-bond br1 bond0 nf2 nf3
