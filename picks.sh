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

# -------------- DEVICE STUFF --------------

# device/samsung_slsi/sepolicy
# repopick 357508 # sepolicy: add policy for super fast charge

# device/lineage/sepolicy
# repopick 357348 # sepolicy: add policy for super fast charge

# -------------- PLATFORM STUFF --------------
# build
repopick -f 369796 # Sorry bro: 6 -> 3

# frameworks/base
# repopick 340916 # SystemUI: add burnIn protection
repopick -f -P frameworks/base 383057 # wm: Optimize window/transition animation scaling

#hardware/samsung
repopick 380288 # doze: bump target SDK version
repopick 383753 # aidl: fingerprint: Only call onEnrollmentsEnumerated when finished

# hardware/samsung_slsi-linaro/configs
repopick 382352 # configs: rename 990 to 9830
repopick 382353 # exynos9830: update variables for T bsp
repopick 382436 # BoardConfig9830: Switch to Vulkan UI renderer

# hardware/samsung_slsi-linaro/exynos
repopick 381617 # kernel-*headers: Symlink videodev2 headers to linux/
repopick 381618 # kernel-4.4-headers: videodev2_exynos_media: Add NV12M definitions
repopick 381619 # libhwjpeg: Add backwards compatibility with older camera blobs

# hardware/samsung_slsi-linaro/graphics
repopick 381623 # libhwjpeg: Add backwards compatibility with older camera blobs
repopick 382354 # exynos9830: update brightness paths
repopick 382355 # exynos9830: switch to EXYNOS_SET_DISPLAY_MODE
repopick 382356 # fixup! graphics: Support EXYNOS_SET_DISPLAY_MODE ioctl
repopick 382357 # fixup! hwc3: Update HalImpl for T BSP
repopick 382435 # base: hwcomposer_property: move properties to system_ext

# hardware/samsung_slsi-linaro/interfaces
repopick 382406 # interfaces: do not build libGeoTrans for 9830
