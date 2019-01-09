#bash $2/start_ovs.sh
#bash $2/config_network_interfaces.sh

# start OVS
ovsdb-server --remote=punix:/usr/local/var/run/openvswitch/db.sock \
                     --remote=db:Open_vSwitch,Open_vSwitch,manager_options \
                     --private-key=db:Open_vSwitch,SSL,private_key \
                     --certificate=db:Open_vSwitch,SSL,certificate \
                     --bootstrap-ca-cert=db:Open_vSwitch,SSL,ca_cert \
                     --pidfile --detach
ovs-vsctl --no-wait init
ovs-vswitchd --pidfile --detach


# config NW interfaces
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

# add ip to the bridge
# bigOne: 10.0.1.4
# vw1: 10.0.1.1
# vw2: 10.0.1.2
# vw3: 10.0.1.3
ip link set dev br0 up
ip addr add 10.0.1.$1/24 dev br0
ip r add 10.0.1.0 via 10.0.1.$1

# change mode for bonds
ovs-vsctl set port bond0 lacp=active
ovs-vsctl set port bond1 lacp=active

ovs-vsctl set port bond0 bond_mode=balance-tcp
ovs-vsctl set port bond1 bond_mode=balance-tcp
