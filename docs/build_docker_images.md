## Build images

1. Clone this repository:

     ```
     git clone git@bitbucket.org:traclabs/dragoman.git
     cd dragoman
     ```

2. Clone software (cFS and ROS workspace with dragoman stuff and edoras metapackage)
  
     ```
     ./scripts/clone_code.sh
     ```
3. Build base images:

     ```
     ./scripts/build_images.sh
     ```
4. Build cFS and dragoman ROS2 workspace:

     ```
     ./scripts/build_cfe.sh
     ./scripts/build_rosws.sh
     ```

