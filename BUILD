"""OpenWrt images"""

load("@//:rules_openwrt.bzl", "openwrt_image")

sh_binary(
    name = "image_builder",
    srcs = ["image_builder.sh"],
    visibility = ["//visibility:public"],
)

openwrt_image(
    name = "rpi4_docker",
    size = 1024,
    srcs = "@imagebuilder_rpi4//:all",
    packages = [
        "block-mount",
        "collectd-mod-network",
        "collectd-mod-thermal",
        "dockerd",
        "kmod-ipvlan",
        "kmod-macvlan",
        "luci",
        "luci-app-dockerman",
        "luci-app-firewall",
        "luci-app-mwan3",
        "luci-app-openvpn",
        "luci-app-opkg",
        "luci-app-pbr",
        "luci-app-statistics",
        "luci-app-unbound",
        "luci-app-wireguard",
        "luci-mod-admin-full",
        "luci-mod-network",
        "luci-mod-status",
        "luci-mod-system",
    ],
    profile = "rpi-4",
)
