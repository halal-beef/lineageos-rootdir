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
repopick 381475 # SystemUI: More notification icons on AOD screen
repopick 383731 # usb: Show charging notification only if power brick is disconnected
repopick 383573 # Allow signature spoofing for microG Companion/Services
repopick 376856 # CarrierConfig: Always show APN settings on CDMA carriers
repopick 376864 # CarrierConfig: allow toggling VoWiFi while roaming by default
repopick 376857 # CarrierConfig: Always show ICCID
repopick 376862 # Enable secondary user logout support by default
# repopick 380205 # Enable backup service by default for all users
repopick -f -P frameworks/base 383057 # wm: Optimize window/transition animation scaling
repopick -f -P frameworks/base 369786 # Alter model name to avoid SafetyNet HW attestation enforcement
repopick -f -P frameworks/base 369787 # keystore: Block key attestation for SafetyNet
repopick -f -P frameworks/base 369788 # AttestationHooks: Set shipping level to 32 for devices >=33
repopick -f -P frameworks/base 369789 # Limit SafetyNet workarounds to unstable GMS process
repopick -f -P frameworks/base 369790 # gmscompat: Apply the SafetyNet workaround to Play Store aswell
repopick -f -P frameworks/base 369791 # gmscompat: Use Nexus 6P fingerprint for CTS/Integrity
repopick -f -P frameworks/base 369792 # gmscompat: Make CTS/Play Integrity pass again
repopick -f -P frameworks/base 374392 # gmscompat: Use new info
repopick -f -P frameworks/base 357510 # gmscompat: also spoof props for samsung/sec apps

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

# hardware/lineage/interfaces
#repopick 357349 # fastcharge: add super fast charge support

# hardware/samsung
#repopick 357350 # fastcharge: move 1.0 impl to separate folder
#repopick 357351 # hidl: fastcharge: add 1.1 impl

# packages/apps/Glimps
repopick 381899 # Glimpse: Drop trash confirmation dialogs

# packages/apps/Settings
repopick 381429 # Handle mobile data on internet page during setup
#repopick 357352 # Settings: add super fast charge toggle

# packages/apps/Trebuchet
repopick -f 368923 # Launcher3: Show clear all button in recents overview

# system/core
repopick -f 374048 # init: Set properties to make SafetyNet pass

# vendor/lineage

# repopick 357968 # config: add super fast charge interface

repopick -t 14-screenrecord

exit 0
