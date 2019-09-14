DISTRO=${DISTRO:-arch}

# Check if the directory is present
if ! [ -d "./$DISTRO" ]; then
  echo "$DISTRO is not supported" 1>&2
  exit 1
fi

# Check if the directory contains install.sh
if ! [ -e "./$DISTRO/install.sh" ]; then
  echo "$DISTRO does not contain install.sh" 1>&2
  exit 1
fi

./$DISTRO/install.sh
