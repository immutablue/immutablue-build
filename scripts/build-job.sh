#!/bin/bash 
BUILD_DIR="/home/zach/Source/immutablue-build"
export REGISTRY_AUTH_FILE="/home/zach/.config/containers/auth.json"

if [[ $# -ge 1 ]] && [[ "$1" == "--prune" ]]
then 
    buildah rmi -af 
fi

buildah login quay.io
cd "$BUILD_DIR"
git pull
make clean
make clone 
make deps
make main 
make main_lts
make derivatives 

# nvidia fails from time to time when repos are out of sync
make nvidia || true 
make downstream 

# again nvidia may fail and i don't want it to fail the whole service
make downstream-nvidia || true

# re-run pruning at end
# useful if running in a vm, keeps disk image small
if [[ $# -ge 1 ]] && [[ "$1" == "--prune" ]]
then 
    buildah rmi -af 
fi

