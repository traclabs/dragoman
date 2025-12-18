FROM osrf/ros:jazzy-desktop-full

# Add ubuntu user to sudoers, and switch to ubuntu user
ARG USERNAME=ubuntu
RUN apt-get update \
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME \
    && chmod 0440 /etc/sudoers.d/$USERNAME
# Switch from root to user
USER $USERNAME

# Update all packages
RUN sudo apt update && sudo apt upgrade -y

# Install extra packages
RUN sudo apt install gdb -y
RUN sudo apt install python3-pip -y

# Rosdep update
RUN rosdep update

# Allow pip to break system packages, which is necessary for installing pip packages through rosdep
RUN echo 'export PIP_BREAK_SYSTEM_PACKAGES=1' >> ~/.bashrc
RUN echo 'export RCUTILS_COLORIZED_OUTPUT=1' >> ~/.bashrc

# Source the ROS setup file
RUN echo "source /opt/ros/${ROS_DISTRO}/setup.bash" >> ~/.bashrc

# Install some extra packages
RUN sudo apt install -y bash-completion
RUN sudo apt install -y cmake-format
RUN PIP_BREAK_SYSTEM_PACKAGES=1 pip3 install black

# Install mujoco
ENV MUJOCO_VERSION=3.3.4
ENV MUJOCO_DIR=/home/ubuntu/mujoco/mujoco-${MUJOCO_VERSION}

RUN sudo apt install -y wget && \
    mkdir -p $(dirname ${MUJOCO_DIR}) && \
    wget https://github.com/google-deepmind/mujoco/releases/download/${MUJOCO_VERSION}/mujoco-${MUJOCO_VERSION}-linux-x86_64.tar.gz -O /tmp/mujoco.tar.gz && \
    tar -xvzf /tmp/mujoco.tar.gz -C $(dirname ${MUJOCO_DIR}) && \
    rm /tmp/mujoco.tar.gz

RUN sudo apt install -y git-lfs

RUN PIP_BREAK_SYSTEM_PACKAGES=1 pip3 install yamcs-pymdb construct yamcs-client

# Set some ROS 2 logging env variables in ~/.bashrc
RUN echo 'export RCUTILS_CONSOLE_OUTPUT_FORMAT="[{name}] {file_name}:{line_number} - {message}"' >> ~/.bashrc

RUN echo 'source /dragoman/rosws/install/local_setup.bash' >> ~/.bashrc

RUN echo 'export ROS_AUTOMATIC_DISCOVERY_RANGE=LOCALHOST' >> ~/.bashrc
