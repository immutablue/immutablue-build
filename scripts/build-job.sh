#!/bin/bash 
BUILD_DIR="/home/zach/Source/immutablue-build"
export REGISTRY_AUTH_FILE="/home/zach/.config/containers/auth.json"

buildah login quay.io
cd "$BUILD_DIR"
make clone 
make main 

# nvidia fails from time to time when repos are out of sync
make nvidia || true 
make downstream 

# again nvidia may fail and i don't want it to fail the whole service
make downstream-nvidia || true

