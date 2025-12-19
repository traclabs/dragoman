#!/bin/bash
set -e

SKIP_KEYS="warehouse_ros_mongo"

SIMULATE=0
REINSTALL=0

# Help menu
if [[ "${1:-}" == "--help" || "${1:-}" == "-h" ]]; then
  echo -e "🔧 ROS Dependency Installer"
  echo -e "===========================\n"
  echo "Usage:"
  echo "  ./install_deps.sh [--simulate] [--reinstall]                Install dependencies for all packages in the workspace."
  echo "  ./install_deps.sh [--simulate] [--reinstall] <pkg1> [...]   Install dependencies for the specified package(s) and their upstream dependencies."
  echo
  echo "Options:"
  echo "  --simulate    Run rosdep with --simulate -r (does not install; prints plan)"
  echo "  --reinstall   Run rosdep with --reinstall"
  echo
  echo "Examples:"
  echo "  ./install_deps.sh craftsman_robots"
  echo "  ./install_deps.sh --reinstall craftsman_robots"
  echo "  ./install_deps.sh --simulate"
  echo
  echo "Notes:"
  echo "  - Uses 'colcon list --packages-up-to' to determine dependency closure."
  echo "  - Skips known non-rosdep keys like: $SKIP_KEYS"
  echo
  exit 0
fi

# Minimal option parsing (only flags; keep original interface)
while [[ "${1:-}" == --* ]]; do
  case "$1" in
    --simulate)
      SIMULATE=1
      shift
      ;;
    --reinstall)
      REINSTALL=1
      shift
      ;;
    *)
      break
      ;;
  esac
done

echo -e "🔧 ROS Dependency Installer\n===========================\n"

# Determine package targets
if [ "$#" -eq 0 ]; then
  echo "📦 No package names provided — installing dependencies for all workspace packages."
  from_paths=$(colcon list --paths-only)
else
  echo "📦 Installing dependencies for packages (and their dependencies):"
  packages=$(colcon list --names-only --packages-up-to "$@")
  printf '   - %s\n' $packages
  from_paths=$(colcon list --paths-only --packages-up-to "$@")
fi

echo -e "\n🚀 Running rosdep install...\n"

EXTRA_ARGS=""
if [ "${REINSTALL}" -eq 1 ]; then
  EXTRA_ARGS="${EXTRA_ARGS} --reinstall"
fi
if [ "${SIMULATE}" -eq 1 ]; then
  EXTRA_ARGS="${EXTRA_ARGS} --simulate -r"
fi

# Temporarily disable exit-on-error to handle rosdep result manually
set +e
rosdep install \
  --ignore-src \
  --default-yes \
  --from-paths $from_paths \
  --skip-keys="$SKIP_KEYS" \
  ${EXTRA_ARGS}
status=$?
set -e

if [ "$status" -eq 0 ]; then
  if [ "${SIMULATE}" -eq 1 ]; then
    echo -e "\n✅ Dependencies successfully resolved (simulate)!\n"
  else
    echo -e "\n✅ Dependencies successfully installed!\n"
  fi
else
  echo -e "\n❌ Failed to process some dependencies."
  echo "🔎 Check the error messages above for missing or unresolvable keys."
  exit 1
fi
