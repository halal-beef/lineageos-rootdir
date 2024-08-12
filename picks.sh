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

# build
repopick -f 369796 # Sorry bro: 6 -> 3

# frameworks/base
repopick -f -P frameworks/base 385512 # BiometricScheduler: Cancel operation if not idle
repopick -f -P frameworks/base 369786 # Alter model name to avoid SafetyNet HW attestation enforcement
repopick -f -P frameworks/base 369787 # keystore: Block key attestation for SafetyNet
repopick -f -P frameworks/base 369788 # AttestationHooks: Set shipping level to 32 for devices >=33
repopick -f -P frameworks/base 369789 # Limit SafetyNet workarounds to unstable GMS process
repopick -f -P frameworks/base 369790 # gmscompat: Apply the SafetyNet workaround to Play Store aswell
repopick -f -P frameworks/base 369791 # gmscompat: Use Nexus 6P fingerprint for CTS/Integrity
repopick -f -P frameworks/base 369792 # gmscompat: Make CTS/Play Integrity pass again
repopick -f -P frameworks/base 374392 # gmscompat: Use new info
repopick -f -P frameworks/base 357510 # gmscompat: also spoof props for samsung/sec apps

# hardware/samsung_slsi-linaro/graphics
repopick 384848 # WIP: libhwc2.1: invalidate last frame before changing display mode

# vendor/lineage
repopick -f -P vendor/lineage 381475 # SystemUI: More notification icons on AOD screen
repopick -f -P vendor/lineage 369794 # lineage: Disable privapp permission enforcement (make it log)

exit 0
