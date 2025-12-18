Run Gateway single-arm example
=================================

This demo has 3 docker containers:

* rosgsw: Ground container, it runs YAMCS
* fsw: Spacecraft container, it runs cFS with a demo application.
* rosfsw: Container that runs the robot with ROS2.

Think of rosgsw as being a machine on Earth, fsw to be the spacecraft on a remote surface, and the rosfsw the machine that runs on the robot hardware.

Communication looks like:
rosgs <-----------> fsw <--> rosfsw


Steps
------

1. Start services:
   ```
   docker compose -f docker-compose.yml up
   ```
   This will start 3 services: fsw, rosgsw and novnc. fsw starts cFS already up

2. In a browser open VNC: http://localhost:8080/vnc.html

3. In another browser, open YAMCS: http://10.5.0.2:8090

4. When you work with cFS, you have to request to have telemetry to be sent back to the ground. It is not sent back by default at startup. To request the telemetry to be sent, go to YAMCS and send a TOLab command. In the argument section, you'll write "10.5.0.2", this is the address of the ground machine, which is the machine where we want to receive the telemetry data. You can verify that data is coming in by checking the Telemetry/Parameter tab.

5. Now you are ready to command the arm. In the Command Tab, you can enter a 3D pose to command the arm to move, for instance, you can enter a pos of 1.0, 1.0, 2.0 and a rotation of 0.0, 0.0, 0.0, 1.0. You should see the arm moving in VNC. If you look at the Telemetry/Parameter tab for the joint states, you should see the values changing as the robot moves. Notice too that the joint values vary at a slower rate than real time (around 1Hz), this is because we have our cFS app set up so the telemetry is being sent back to a lower rate.
