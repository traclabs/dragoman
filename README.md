# Dragoman workspace

This workspace contains the docker and configuration files necessary to build an end-to-end demo with YAMCS on one side and FSW (cFS) on the other end.

**Note:** Git LFS must be installed before cloning this repository.

## Installation

1. Install git-lfs:

    ```sh
    sudo apt install git-lfs
    ```

1. Clone this repository:

    ```sh
    git clone https://www.github.com/traclabs/dragoman.git
    cd dragoman
    ```

1. Clone software (cFS and dragoman ROS workspace)

    ```sh
    ./scripts/clone_code.sh
    ```

1. Build the Demo Images

    ```sh
    ./scripts/build_images.sh
    ```

    Note that we currently have 3 demos: Gateway, Lunar Exploration (VIPER), and Mobile Servicing System (ISS). All demos
    use ROS2 as a backend for simulating the robot assets, hence they share the same image. Building the Gateway image thus produces the same
    image.

## Demos


Note: You may need to enable xhost for GUI apps to come up for the demos. Run:
```
xhost +local:root > /dev/null
```

### Lunar Exploration Demo (VIPER)

```sh
./scripts/docker_up_lunar_exploration.sh
```
See [Lunar Exploration](demo_lunar_exploration.md) for details.

### Mobile Servicing System Demo (ISS)

```sh
./scripts/docker_up_mobile_servicing_system.sh
```
See [Mobile Servicing System](demo_mobile_servicing_system.md) for details

### Lunar Gateway Demo

```sh
./scripts/docker_up_gateway.sh
```
See [Gateway Demo](demo_gateway.md) for details
