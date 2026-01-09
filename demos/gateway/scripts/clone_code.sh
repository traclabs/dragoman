#!/usr/bin/env bash

ROSWS="rosws"

# *******************
# clone_cfs
# *******************
clone_cfs() {

  echo "* Cloning cFS and edoras_app"
  vcs import . < fsw.repos

  pushd cFS
  git submodule update --init --recursive
  popd
}

# *******************
# clone_edoras_code
# *******************
clone_edoras_code() {

  echo "* Cloning edoras_core... "
  git clone -b master git@github.com:traclabs/edoras_core.git edoras_core
}

# *******************
# clone_edoras
# *******************
clone_edoras() {

  echo "* Cloning edoras... "
  if [ ! -d $ROSWS ]; then
    echo "    ** Creating directory $ROSWS"
    mkdir $ROSWS
  fi

  if [ ! -d $ROSWS/src ]; then
    echo "    ** Creating directory $ROSWS/src"
    mkdir -p $ROSWS/src
  fi

  vcs import $ROSWS/src < edoras_bridge.repos
}

# *******************
# clone_dragoman
# *******************
clone_dragoman() {

  echo "* Cloning dragoman... "
  if [ ! -d $ROSWS ]; then
    echo "    ** Creating directory $ROSWS"
    mkdir $ROSWS
  fi

  if [ ! -d $ROSWS/src ]; then
    echo "    ** Creating directory $ROSWS/src"
    mkdir $ROSWS/src
  fi

  vcs import $ROSWS/src < rolling.repos
}

# ************************
# clone_extra_robots
# ************************
clone_extra_edoras_robots() {

  echo ""
  echo "* Cloning additional robots for Edoras demos...*"
  vcs import $ROSWS/src < edoras_extra_robots.repos

  touch $ROSWS/src/trac_ik/trac_ik_kinematics_plugin/COLCON_IGNORE
}

clone_cfs
clone_edoras_code
clone_edoras
clone_dragoman

# Default mode=skip_robots for Dragoman (no need for edoras robot demos)
mode="skip_robots" # include_robots skip_robots

if [[ $# -eq 1 ]]; then
  mode = $1
fi

if [[ mode -eq "include_robots" ]]; then

  echo ""
  echo "* Clone extra Edoras robots"
  clone_extra_edoras_robots
fi

exit 1
