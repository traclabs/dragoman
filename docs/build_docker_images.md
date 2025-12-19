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

4. Build cFS app:

     ```
     ./scripts/build_cfe.sh
     ```

5. (Optional) If you want to recompile the rosws image, simply run:

     ```
     ./scripts/build_images.sh
     ```
