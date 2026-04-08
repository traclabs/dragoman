Run Mobile Servicing Sytem demo
=================================

Video:

[![](https://img.youtube.com/vi/tZRtDx-bQxo/0.jpg)](https://www.youtube.com/watch?v=tZRtDx-bQxo)

This demo has 4 docker containers:

* rosgsw: Ground container that runs ROS2. Communicates with YAMCS.
* yamcs: Ground container, it runs YAMCS
* fsw: Spacecraft container, it runs cFS with a demo application.
* rosfsw: Container that runs the robot with ROS2.

Think of yamcs as running on a machine on Earth, fsw to be the spacecraft on a remote surface, and the rosfsw the machine that runs on the robot hardware.

Communication looks like:
rosgsw <--> yamcs <-----------> fsw <--> rosfsw

Note: You may need to enable xhost for GUI apps to come up for the demos. Run:
```
xhost +local:root > /dev/null
```

Steps
------

1. Build docker images, (if not built already):
   ```
   ./scripts/build_images_mobile_servicing_system.sh
   ```

1. Start services:
   ```
   ./scripts/docker_up_mobile_servicing_system.sh
   ```
   This will start 4 services: rosgsw, yamcs, fsw, and rosfsw.

1. In another browser, open YAMCS: http://10.5.0.2:8090

1. Go to Commanding > Send a command. Click on ``LunarExploration/`` and select ``TOLabEnablePacket``. In the argument section under ``dest_ip``, write ``10.5.0.2``, and click on Send. This will enable the telemetry to be sent back to the ground. You should see telemetry from the ISS in RViz now.

1. Go to Procedures > Stacks. Click on ``Upload stack``. Go to ``dragoman/yamcs/stacks/BatteryReplacement/``, then select all files in there and open them. You should see seven stacks loaded. Click on ``BatteryReplacement_1_MoveToRack.ycs`` and click on the icon in the top bar that says ``Run all from selected step`` when hovered over with a mouse. This will run a procedure that commands the robot to perform the first part of the battery replacement.

1. Once complete, return to Procedures > Stacks, and click on ``BatteryReplacement_2_RemoveBattery.ycs``, and follow same instructions as above. Repeat for all seven steps. The overall goal of the demo is to remove the old battery from the solar panel truss, and replace it with a new battery from the HTV pallet. The batteries aren't visible in rviz, but they are visible in Gazebo.
