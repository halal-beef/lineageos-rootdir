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

repopick 411101 # Add boardconfig for converting legacy boardconfig flags to blueprint

# -------------- PLATFORM STUFF --------------

# hardware/samsung_slsi-linaro/config
repopick 411147 # BoardConfig9830: update for soong variables

exit 0
