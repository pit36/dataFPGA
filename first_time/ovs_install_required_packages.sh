git clone https://github.com/openvswitch/ovs.git
cd ovs/
git checkout v2.7.0
git checkout origin/branch-2.7
apt install autoconf
apt install libtool
apt install automake
apt install python
apt install python-pip
pip install six

./boot.sh
./configure
#make
#make install
