#!/bin/bash
#========================================================================================================================
# https://github.com/ophub/amlogic-s9xxx-openwrt
# Description: Automatically Build OpenWrt for Amlogic s9xxx tv box
# Function: Diy script (Before Update feeds, Modify the default IP, hostname, theme, add/remove software packages, etc.)
# Source code repository: https://github.com/coolsnowwolf/lede / Branch: master
#========================================================================================================================

# Add a feed source
# sed -i '$a src-git lienol https://github.com/Lienol/openwrt-package' feeds.conf.default

# other
# rm -rf package/lean/{samba4,luci-app-samba4,luci-app-ttyd}


# 更新 `generic.mk` 文件
sed -i '/define Device\/mercury_mw4530r-v1/s/\$(Device\/tplink-8mlzma)/\$(Device\/tplink-16mlzma)/' target/linux/ath79/image/generic.mk

# 更新 `ar9344_tplink_tl-wdrxxxx.dtsi` 文件
sed -i '91s/reg = <0x020000 0x7d0000>;$/reg = <0x020000 0xfd0000>;/' target/linux/ath79/dts/ar9344_tplink_tl-wdrxxxx.dtsi
sed -i '96s/reg = <0x7f0000 0x010000>;$/reg = <0xff0000 0x010000>;/' target/linux/ath79/dts/ar9344_tplink_tl-wdrxxxx.dtsi
