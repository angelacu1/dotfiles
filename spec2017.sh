#!/bin/bash

# 0) Paths
ISO=/scratch/spec2017/cpu2017-1.1.9.iso
LOCAL_ROOT=/scratch/spec2017
MEDIA_DIR=$LOCAL_ROOT/cpu2017-media-1.1.9
INSTALL_DIR=$LOCAL_ROOT/cpu2017-1.1.9
# mkdir -p "$MEDIA_DIR" "$INSTALL_DIR"
# 1) Extract ISO contents without mounting
# bsdtar -C "$MEDIA_DIR" -xf "$ISO"
# 2) Install SPEC to your local install dir
# cd "$MEDIA_DIR"
# chmod +x install.sh
# ./install.sh -d "$INSTALL_DIR"
# 3) Enable SPEC in current shell
pushd $PWD > /dev/null

cd "$INSTALL_DIR"
export SPEC_DIR="$INSTALL_DIR" # this is set for SPECKLE
source "$SPEC_DIR/shrc"
# 4) Verify
# runcpu --version

popd > /dev/null