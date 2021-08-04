#!/usr/bin/env bash

# load environment settings from .bashrc
source /home/crtx/ros-config.sh
source /opt/ros/melodic/setup.bash
source /opt/crtx_vision_module/devel/setup.bash
journalctl --vacuum-size=200M

#echo "Waiting for network to come online"
#until nc -vzw 2 $ROS_HOSTNAME 22; do sleep 1; done
#echo "Network online"

#sudo modprobe uvcvideo

# clear ROS log
rm -rf /home/crtx/.ros/log

### Start ROS launch scripts
echo "launching ROS"
echo "$PATH"
#USE_NODELETS=false 
roslaunch data_base_recorder recorder.launch

