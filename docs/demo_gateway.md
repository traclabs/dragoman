Run Gateway single-arm example
=================================

This demo has 4 docker containers:

* rosgsw: Ground container running ROS2 (Rviz)
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
   ./scripts/build_images_gateway.sh
   ```

1. Start services:
   ```
   ./scripts/docker_up_gateway.sh
   ```
   This will start 4 services: rosgsw, yamcs, fsw, and rosfsw.

1. In another browser, open YAMCS: http://10.5.0.2:8090

1. Go to Commanding > Send a command. Click on ``LunarExploration/`` and select ``TOLabEnablePacket``. In the argument section under ``dest_ip``, write ``10.5.0.2``, and click on Send. This will enable the telemetry to be sent back to the ground. You should see telemetry from the Lunar Gateway in RViz now.

1. Go to Commanding > Send a command. For ee_pose, enter 1, 1, 2, 0, 0, 0, 1. This corresponds to a pose of position(x,y,z) - [1.0, 1.0, 2.0] and quaternion(x,y,z,w) - [0.0, 0.0, 0.0, 1.0]. Click on Send. You should see the robot arm updating in RViz (GROUND) at 1fps.
