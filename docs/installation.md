## Build images

1. Clone this repository:

     ```
     git clone git@bitbucket.org:traclabs/dragoman.git
     cd dragoman
     ```

1. Clone software (cFS and dragoman ROS workspace)

     ```
     ./scripts/clone_code.sh
     ```

1. Build base images (gateway + viper):

     ```
     ./scripts/build_images.sh
     ```

   Note that we currently have 4 demos: Viper (uses Nvidia ISAAC Sim) and Gateway/Lunar Exploration/Mobile Servicing System. The last three
   use ROS2 as a backend for simulating the robot assets, hence they share the same image. Building the Gateway image thus produces the same
   image that is used by either of the other 2 demos.

1. (Optional) Bring up the demo stacks:

     Note: To enable GUI apps inside the dev container, run:
     ```
     xhost +local:root > /dev/null
     ```

     Lunar Exploration: See [Lunar Exploration](demo_lunar_exploration.md) for details
     ```
     ./scripts/docker_up_lunar_exploration.sh
     ```

     Mobile Servicing System: See [Mobile Servicing System](demo_mobile_servicing_system.md) for details
     ```
     ./scripts/docker_up_mobile_servicing_system.sh
     ```

     Gateway: See [Gateway Demo](demo_gateway.md) for details
     ```
     ./scripts/docker_up_gateway.sh
     ```

     Viper (ISAAC): See [Viper Demo](demo_viper.md) for details
     ```
     ./scripts/docker_up_viper.sh
     ```


