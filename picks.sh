#!/bin/bash

set -e

function privpick() {
  git -C $1 fetch github $2
  git -C $1 cherry-pick FETCH_HEAD
}

function checkchain() {
  git -C $1 fetch github $2
  git -C $1 checkout FETCH_HEAD
}

source build/envsetup.sh


# -------------- PLATFORM STUFF --------------

# hardware/samsung_slsi-linaro/graphics
repopick 384848 # WIP: libhwc2.1: invalidate last frame before changing display mode

exit 0
