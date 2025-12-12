#!/usr/bin/env bash
set -e

# This script runs the ROS GSW Applications and logs stdout+stderr to discrete log files
# It is primarily intended for usage within a Docker container

LOG_DIR="."

DO_ROS_SOURCE=0
DO_LOCAL_SOURCE=1
ROS_VERSION="jazzy"

if [[ $DO_ROS_SOURCE -eq 1 ]]; then
    echo "source /opt/ros/${ROS_VERSION}/setup.bash"
fi


if [[ $DO_LOCAL_SOURCE -eq 1 ]]; then
    source install/local_setup.sh
fi

# Start Dragoman Gateway example that talks with cFS using a socket
echo "Run Gateway"
 ros2 launch dragoman_fsw_sim gateway_single_arm_flight_demo_multihost.launch.py  &

              
# Wait for any process to exit
echo "Waiting for tasks to exit"
wait -n

# Exit with status of process that exited first
exit $?
