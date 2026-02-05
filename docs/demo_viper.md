Run Viper Simulation Demo
==========================

This demo brings up the NVIDIA Isaac Sim simulator with the VIPER (Volatiles Investigating Polar Exploration Rover) robot in a lunar environment.

**Note:** Initial startup may take some time due to shader caching.

Note: To enable GUI apps inside the dev container, run:
```
xhost +local:root > /dev/null
```

Steps
-----

1. Build docker images, (if not built already):
   ```
   ./scripts/build_images_viper.sh
   ```

1. Start the viper services:
   ```
   ./scripts/docker_up_viper.sh
   ```

1. The Isaac Sim GUI will appear on your display showing the VIPER rover on the lunar surface.
