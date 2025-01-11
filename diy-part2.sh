#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================

echo -e "\\ndefine Device/lemonPi_pi1
\$(call Device/rk3588)
  DEVICE_MODEL := lemonpi-pi1
  SUPPORTED_DEVICES += lemonpi,lemonpi-pi1
  DEVICE_DTS := rk3588-lemonpi-pi1
endef
TARGET_DEVICES += lemonPi_pi1" >> target/linux/rockchip/image/rk35xx.mk


cp -f $GITHUB_WORKSPACE/configfiles/rk3588-lemonpi-pi1.dts target/linux/rockchip/dts/rk3588
ls target/linux/rockchip/dts/rk3588
cat target/linux/rockchip/image/rk35xx.mk



