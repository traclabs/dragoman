FROM ubuntu:24.04

# Disable interactive frontend
ENV DEBIAN_FRONTEND=noninteractive

# Install Java 17 and Maven
RUN apt-get update && \
    apt-get install -y \
    openjdk-17-jdk \
    maven \
    && rm -rf /var/lib/apt/lists/*

# Set Java environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Create directory structure to maintain relative paths
RUN mkdir -p /rosws/src/dragoman_sandbox/dragoman_sample_msgs/xtce

# Copy XTCE files to maintain the same relative path structure
COPY rosws/src/dragoman_sandbox/dragoman_sample_msgs/xtce/*.xtce \
     /rosws/src/dragoman_sandbox/dragoman_sample_msgs/xtce/

# Copy yamcs_project files
COPY yamcs_project /yamcs_project

# Set working directory
WORKDIR /yamcs_project

# Pre-compile and package yamcs
RUN mvn package

# Run yamcs using the pre-compiled bundle
CMD ["mvn", "yamcs:run"]
