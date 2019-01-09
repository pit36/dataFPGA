git clone https://github.com/openvswitch/ovs.git
cd ovs/
git checkout v2.7.0
git checkout origin/branch-2.7
sudo apt install autoconf
sudo apt install libtool
sudo apt install automake
sudo apt install python
sudo apt install python-pip
sudo pip install six

./boot.sh
./configure
#make
#make install
