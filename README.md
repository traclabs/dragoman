# README #

This README would normally document whatever steps are necessary to get your application up and running.

### Installation ###

* Install [pymdb](https://github.com/yamcs/pymdb) to generate XTCE:
  ```
  pip install yamcs-pymdb
  ```
* Clone repos:
  ```
  cd ~/ros2
  git clone git@bitbucket.org:traclabs/dragoman
  cd dragoman
  mkdir src
  vcs import src < jazzy.repos
  ```
* Compile
  ```
  source /opt/ros/jazzy/setup.bash
  colcon build --symlink-install
  ```

