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

## Demos

### Lunar Exploration Demo (VIPER)

[![](https://img.youtube.com/vi/aWDqH6VneQM/0.jpg)](https://www.youtube.com/watch?v=aWDqH6VneQM)

See [Lunar Exploration](docs/demo_lunar_exploration.md) for details.

### Mobile Servicing System Demo (ISS)

[![](https://img.youtube.com/vi/tZRtDx-bQxo/0.jpg)](https://www.youtube.com/watch?v=tZRtDx-bQxo)

See [Mobile Servicing System](docs/demo_mobile_servicing_system.md) for details

### Lunar Gateway Demo

See [Gateway Demo](docs/demo_gateway.md) for details
