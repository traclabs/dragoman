#!/usr/bin/env bash

echo ""
echo "##### Building rosgsw #####"
echo ""

COMPOSE_FILE="docker-compose-dev.yml"
CODE_DIR="/code"

# Build workspace
build_edoras_code() {
  docker compose -f ${COMPOSE_FILE} run -w ${CODE_DIR}/rosws rosgsw colcon build --symlink-install
  docker compose -f ${COMPOSE_FILE} run -w ${CODE_DIR}/rosws rosgsw /bin/bash  -ic  "source install/setup.bash && ros2 run dragoman_sample_xtce generate_xtces.sh" 
  ret=$?
  if [ $ret -ne 0 ]; then
    echo "!! Failed in colcon build step that builds edoras workspace !!"
    return 1  
  fi
  
  return 0
}

 
# Going...
echo "**** Building edoras... ****"
build_edoras_code
edoras_res=$?

if [ $edoras_res -eq 1 ]; then
  exit 1
fi

   
echo ""
echo "##### Done! #####"
exit 0
