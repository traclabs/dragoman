Run Mobile Servicing Sytem demo
=================================

This demo has 4 docker containers:

* rosgsw: Ground container that runs ROS2. Communicates with YAMCS.
* yamcs: Ground container, it runs YAMCS
* fsw: Spacecraft container, it runs cFS with a demo application.
* rosfsw: Container that runs the robot with ROS2.

Think of yamcs as running on a machine on Earth, fsw to be the spacecraft on a remote surface, and the rosfsw the machine that runs on the robot hardware.

Communication looks like:
rosgsw <--> yamcs <-----------> fsw <--> rosfsw

Note: To enable GUI apps inside the dev container, run:
```
xhost +local:root > /dev/null
```

Steps
------

1. Start services:
   ```
   ./scripts/docker_up_mobile_servicing_system.sh
   ```
   This will start 4 services: rosgsw, yamcs, fsw, and rosfsw.

1. In another browser, open YAMCS: http://10.5.0.2:8090

1. When you work with cFS, you have to request to have telemetry to be sent back to the ground. It is not sent back by default at startup. To request the telemetry to be sent, go to YAMCS and send a TOLab command. In the argument section, you'll write "10.5.0.2", this is the address of the ground machine, which is the machine where we want to receive the telemetry data. You can verify that data is coming in by checking the Telemetry/Parameter tab.

1. Now you are ready to command the arm. In the Command Tab, you can enter a 3D pose to command the arm to move, for instance, you can enter a pos of 1.0, 1.0, 2.0 and a rotation of 0.0, 0.0, 0.0, 1.0. You should see the arm moving in VNC. If you look at the Telemetry/Parameter tab for the joint states, you should see the values changing as the robot moves. Notice too that the joint values vary at a slower rate than real time (around 1Hz), this is because we have our cFS app set up so the telemetry is being sent back to a lower rate.
