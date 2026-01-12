## Build images

1. Clone this repository:

     ```
     git clone git@bitbucket.org:traclabs/dragoman.git
     cd dragoman
     ```

2. Clone software (cFS and dragoman ROS workspace)

     ```
     ./scripts/clone_code.sh
     ```

3. Build base images (gateway + viper):

     ```
     ./scripts/build_images.sh
     ```

4. Build cFS app (uses gateway compose file):

     ```
     ./scripts/build_cfe.sh
     ```

5. (Optional) Bring up the demo stacks:

     Gateway: See [Gateway Demo](demo_gateway.md) for details
     ```
     ./scripts/docker_up_gateway.sh
     ```

     Viper: See [Viper Demo](demo_viper.md) for details
     ```
     ./scripts/docker_up_viper.sh
     ```
