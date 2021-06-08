sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver 'hkp://keyserver.ubuntu.com:80' --recv-key C1CF6E31E6BADE8868B172B4F42ED6FBAB17C654
sudo apt-get update
sudo apt-get install -y ros-melodic-desktop-full
sudo apt install python-rosdep python-rosinstall python-rosinstall-generator python-wstool build-essential

sudo apt-key adv --keyserver keys.gnupg.net --recv-key C8B3A55A6F3EFCDE || sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C8B3A55A6F3EFCDE

sudo apt-get update

sudo rosdep init
rosdep update

sudo apt install -y zsh git build-essential
sudo apt install -y python-rosinstall python-rosinstall-generator python-wstool build-essential python-catkin-tools

# setup recorder
cd /opt/
sudo git clone https://github.com/richrdcm/crtx_vision_module
sudo chown -R crtx:crtx /opt/crtx_vision_module

sudo apt install -y clang
source /opt/ros/melodic/setup.bashrc
catkin config --cmake-args -DCMAKE_C_COMPILER=/usr/bin/clang -DCMAKE_CXX_COMPILER=/usr/bin/clang++
catkin build


git git clone http://richrdcm/crtx_vision_module-config
cd crtx_vision_module-config
sudo chown -R root:root etc
sudo cp -r etc/* /etc
sudo rm /etc/netplan/01-network-manager-all.yaml
sudo ip link set eno1 up

# adjust wireless interfaces
sudo nano /etc/netplan/02-wireless.yaml

cp ros-config.sh ..
cp autostart.sh ..
cp .bashrc ..
cp .zshrc ..
sudo chmod +x ../autostart.sh
sudo systemctl enable crtx.service

sudo bash -c 'echo "ros ALL=(ALL) NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown" >> /etc/sudoers'


