#!/usr/bin/env bash

ROSWS="rosws"

# *******************
# clone_cfs
# *******************
clone_cfs() {

  echo "* Cloning cFS and edoras_app"
  vcs import cfs < cfs/cfs.repos

  pushd cfs
  git submodule update --init --recursive
  popd
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

  vcs import $ROSWS/src < $ROSWS/rolling.repos
}

clone_cfs
clone_dragoman

exit 0
