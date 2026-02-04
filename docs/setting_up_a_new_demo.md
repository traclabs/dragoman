Steps
======

1. Choose the robot and simulation environment (Rviz, Gazebo, ISAAC). This will run in the **rosfsw** container.
2. Come up with the TM/TC for this demo.
3. Go to dragoman_sample_msgs/scripts, and add a script to create your XTCE file that describes (2).
4. Add a mention of the script in dragoman_sample_msgs/scripts/generate_xtces.sh
5. In yamcs.dragoman.yaml (yamcs/src/main/yamcs/etc), in the mdb section, add a reference to the new XTCE file.
6. Generate the corresponding ROS2 message: Go to dragoman_sample_msgs and add the next robot's XTCE in the macro xtce_generate_messages
7. Add a script to get the message from YAMCS in dragoman_ground_example (copy one of the existing ones and adapt)

Important
---------
In Yamcs, comment any other project that uses the same ports for telemetry. 
