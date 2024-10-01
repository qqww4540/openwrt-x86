#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate

curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/poweroff.htm > ./feeds/luci/modules/luci-mod-admin-full/luasrc/view/admin_system/poweroff.htm
curl -fsSL  https://raw.githubusercontent.com/sirpdboy/other/master/patch/poweroff/system.lua > ./feeds/luci/modules/luci-mod-admin-full/luasrc/controller/admin/system.lua

rm -rf feeds/packages/utils/v2dat
rm -rf feeds/packages/net/v2ray-geodata
rm -rf feeds/luci/applications/luci-app-adguardhome && rm -rf feeds/packages/net/adguardhome
rm -rf feeds/luci/applications/luci-app-mosdns && rm -rf feeds/packages/net/mosdns
rm -rf feeds/luci/applications/luci-app-smartdns && rm -rf feeds/packages/net/smartdns
rm -rf feeds/packages/lang/golang
git clone https://github.com/sbwml/packages_lang_golang -b 23.x feeds/packages/lang/golang
git clone https://github.com/kenzok8/openwrt-packages package/kenzo
git clone https://github.com/kenzok8/small package/small
#git clone -b main --single-branch https://github.com/morytyann/OpenWrt-mihomo package/openWrt-mihomo
