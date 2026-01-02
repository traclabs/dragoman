##############
# Base stage #
##############
FROM ros:jazzy-ros-core AS baser

# Disable interactive frontend
ENV DEBIAN_FRONTEND=noninteractive

# Disable automatic apt cache removal (BuildKit cache mounts will manage it)
RUN rm -f /etc/apt/apt.conf.d/docker-clean

# Update all packages
RUN --mount=type=cache,sharing=locked,target=/var/cache/apt \
    apt update

# Upgrade all packages
RUN --mount=type=cache,sharing=locked,target=/var/cache/apt \
    apt upgrade -y

# Install pip
RUN --mount=type=cache,sharing=locked,target=/var/cache/apt \
    apt install python3-pip python3-colcon-common-extensions -y

# ################
# # Cacher stage #
# ################
FROM baser AS cacher

# Install rosdep
RUN --mount=type=cache,sharing=locked,target=/var/cache/apt \
    apt install python3-rosdep -y

# Initialize rosdep
RUN rosdep init && \
    rosdep update

# Copy the src directory into image
WORKDIR /ws
COPY rosws/src /ws/src
COPY rosws/install_deps.sh /ws/install_deps.sh
COPY rosws/colcon_defaults.yaml /ws/colcon_defaults.yaml

# Generate sorted lists of ROS dependencies (APT and PIP)
RUN /ws/install_deps.sh --simulate --reinstall > /tmp/rosdep_output.txt; \
    # Search for lines containing 'apt-get install' and extract the package names
    grep 'apt-get install' /tmp/rosdep_output.txt \
    | awk '{print $4}' | tr -d "'" | sort > /tmp/apt_deps.txt; \
    # Search for lines containing 'pip3 install' and extract the package names
    grep 'pip3 install' /tmp/rosdep_output.txt \
    | awk '{print $5}' | tr -d "'" | sort > /tmp/pip_deps.txt;

###############
# Final stage #
###############
FROM baser AS final

# Go into ROS WS
WORKDIR /ws

# Install some utilities
# - ccache: For caching build/ install/ across docker builds
# - git: Needed for mujoco_ros2_simulation's CMakeLists.txt to do an ExternalProject_Add
RUN --mount=type=cache,target=/var/cache/apt/archives \
    apt install -y ccache git

# Set up ccache
ENV CC="ccache gcc"
ENV CXX="ccache g++"
ENV CCACHE_DIR=/ws/ccache

# Install APT dependencies
COPY --link --from=cacher /tmp/apt_deps.txt /tmp/apt_deps.txt
RUN --mount=type=cache,sharing=locked,target=/var/cache/apt \
    xargs -a /tmp/apt_deps.txt apt-get install -y --no-install-recommends

# Install PIP dependencies (if any)
COPY --link --from=cacher /tmp/pip_deps.txt /tmp/pip_deps.txt
RUN --mount=type=cache,sharing=locked,target=/root/.cache/pip \
    if [ -s /tmp/pip_deps.txt ]; then \
      PIP_BREAK_SYSTEM_PACKAGES=1 xargs -a /tmp/pip_deps.txt -n 1 pip3 install -U -I ; \
    fi

# Copy the src directory into image
COPY rosws/src /ws/src
COPY rosws/colcon_defaults.yaml /ws/colcon_defaults.yaml

# Build the workspace
RUN --mount=type=cache,target=/ws/ccache \
    . /opt/ros/jazzy/setup.sh && \
    colcon build
