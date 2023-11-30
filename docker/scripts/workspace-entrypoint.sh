#!/bin/bash
#
# Copyright (c) 2021, NVIDIA CORPORATION.  All rights reserved.
#
# NVIDIA CORPORATION and its licensors retain all intellectual property
# and proprietary rights in and to this software, related documentation
# and any modifications thereto.  Any use, reproduction, disclosure or
# distribution of this software and related documentation without an express
# license agreement from NVIDIA CORPORATION is strictly prohibited.

# Build ROS dependency
echo "source /workspaces/isaac_ros-dev/install/setup.bash" >> ~/.bashrc
source /opt/ros/${ROS_DISTRO}/setup.bash

sudo apt-get update
rosdep update

# Restart udev daemon
sudo service udev restart

sudo sysctl -w net.core.rmem_max=134217728 net.core.rmem_default=134217728

$@
