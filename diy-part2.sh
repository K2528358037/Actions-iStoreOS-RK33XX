#!/bin/bash
#===============================================
# Description: DIY script
# File name: diy-script.sh
# Lisence: MIT
# Author: P3TERX
# Blog: https://p3terx.com
#===============================================


# update ubus git HEAD
cp -f $GITHUB_WORKSPACE/configfiles/ubus_Makefile package/system/ubus/Makefile


# 近期istoreos网站文件服务器不稳定，临时增加一个自定义下载网址
sed -i "s/push @mirrors, 'https:\/\/mirror2.openwrt.org\/sources';/&\\npush @mirrors, 'https:\/\/github.com\/xiaomeng9597\/files\/releases\/download\/iStoreosFile';/g" scripts/download.pl


#修改uhttpd配置文件，启用nginx
# sed -i "/.*uhttpd.*/d" .config
# sed -i '/.*\/etc\/init.d.*/d' package/network/services/uhttpd/Makefile
# sed -i '/.*.\/files\/uhttpd.init.*/d' package/network/services/uhttpd/Makefile
sed -i "s/:80/:81/g" package/network/services/uhttpd/files/uhttpd.config
sed -i "s/:443/:4443/g" package/network/services/uhttpd/files/uhttpd.config
cp -a $GITHUB_WORKSPACE/configfiles/etc/* package/base-files/files/etc/
# ls package/base-files/files/etc/


echo -e "\\define Device/lemonPi_pi1
$(call Device/rk3588)
  DEVICE_MODEL := lemonpi-pi1
  SUPPORTED_DEVICES += lemonpi,lemonpi-pi1
  DEVICE_DTS := rk3588-lemonpi-pi1
  DVICE_PACKAGES := kmod-r8125 kmod-nvme kmod-scsi-core kmod-hwmon-pwmfan kmod-thermal
endef
TARGET_DEVICES += lemonPi_pi1" >> target/linux/rockchip/image/rk35xx.mk


cp -f $GITHUB_WORKSPACE/configfiles/rk3588-lemonpi-pi1.dts target/linux/rockchip/dts/rk3588



