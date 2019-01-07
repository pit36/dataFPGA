bash start_ovs.sh
bash config_network_interfaces.sh
# add ip to the bridge
# bigOne: 10.0.1.1
# vw1: 10.0.1.2
# vw2: 10.0.1.3
# vw3: 10.0.1.4
ip addr add 10.0.1.2/24 br0
