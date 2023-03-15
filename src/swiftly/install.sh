#!/usr/bin/env bash
set -e
set -x

# The 'install.sh' entrypoint script is always executed as the root user.
#
# These following environment variables are passed in by the dev container CLI.
# These may be useful in instances where the context of the final 
# remoteUser or containerUser is useful.
# For more details, see https://containers.dev/implementors/features#user-env-var
# echo "The effective dev container remoteUser is '$_REMOTE_USER'"
# echo "The effective dev container remoteUser's home directory is '$_REMOTE_USER_HOME'"

# echo "The effective dev container containerUser is '$_CONTAINER_USER'"
# echo "The effective dev container containerUser's home directory is '$_CONTAINER_USER_HOME'"

STARTDIR=$(pwd)
TEMPDIR=$(mktemp -d)
VERSION=${VERSION:-"default"}

cleanup()
{
    cd "$STARTDIR"
    if [ -n "$TEMPDIR" ]; then
        rm -rf "$TEMPDIR"
    fi
}

trap cleanup EXIT $?

echo "Downloading patrickfreed/swiftly"
git clone https://github.com/patrickfreed/swiftly "$TEMPDIR"
cd "$TEMPDIR"
git checkout bootstrap
source ./install/swiftly-install.sh -y
