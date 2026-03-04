FROM ubuntu:24.04

# Disable interactive frontend
ENV DEBIAN_FRONTEND=noninteractive

# Install Java 17 and Maven
RUN apt-get update && \
    apt-get install -y \
    openjdk-17-jdk \
    maven \
    iproute2 \
    iputils-ping \
    && rm -rf /var/lib/apt/lists/*

# Set Java environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Set working directory
WORKDIR /yamcs

# Copy pom.xml first for better layer caching
COPY yamcs/pom.xml ./pom.xml

# Download all dependencies (cached unless pom.xml changes)
RUN mvn dependency:go-offline -B

# Copy the rest of the project files
COPY yamcs/src ./src

# Build the project (only rebuilds when source code changes)
RUN mvn package

# Create directory structure to maintain relative paths
RUN mkdir -p /rosws/src/dragoman_sandbox/dragoman_sample_msgs/xtce

# Copy XTCE files to maintain the same relative path structure
COPY rosws/src/dragoman_sandbox/dragoman_sample_msgs/xtce/*.xtce \
     /rosws/src/dragoman_sandbox/dragoman_sample_msgs/xtce/

# Copy script for simulating delay in communication
COPY --chown=${USERNAME}:${USERNAME} demos/lunar_exploration/config/script_delay.sh /rosws/script_delay.sh

# Run yamcs using the pre-compiled bundle
CMD ["mvn", "yamcs:run"]
