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

# hardware/samsung_slsi-linaro/exynos
repopick 399491 # audiohal_comv1: return BT SCO device when an actual BT SCO device is used
repopick 399492 # exynos: audiohal_comv1: Always allow to reconfigure stream if voice  recognition is active
repopick 399493 # exynos: audiohal_comv1: Ensure AUDIO_INPUT_FLAG_FAST is set when using low latency capture samplerate during calls

# hardware/samsung_slsi-linaro/graphics
repopick 384848 # WIP: libhwc2.1: invalidate last frame before changing display mode

exit 0
