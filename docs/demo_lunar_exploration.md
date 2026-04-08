Run Lunar Exploration demo
=================================

Video:

[![](https://img.youtube.com/vi/aWDqH6VneQM/0.jpg)](https://www.youtube.com/watch?v=aWDqH6VneQM)

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
   ./scripts/build_images_lunar_exploration.sh
   ```

1. Start services:
   ```
   ./scripts/docker_up_lunar_exploration.sh
   ```
   This will start 4 services: rosgsw, yamcs, fsw, and rosfsw.

1. In another browser, open YAMCS: http://10.5.0.2:8090

1. Go to Commanding > Send a command. Click on ``LunarExploration/`` and select ``TOLabEnablePacket``. In the argument section under ``dest_ip``, write ``10.5.0.2``, and click on Send. This will enable the telemetry to be sent back to the ground. You should see telemetry from the VIPER robot in RViz now.

1. Go to Procedures > Stacks. Click on ``Upload stack``. Open ``dragoman/yamcs/stacks/NavigateAroundCrater.ycs``. Click on the loaded stack, and click on the icon in the top bar that says ``Run all from selected step`` when hovered over with a mouse. This will run a procedure that commands the robot to move around a crater. You should see the robot moving in RViz, and you should see the telemetry values changing in YAMCS as well.
