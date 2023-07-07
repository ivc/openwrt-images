load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "imagebuilder_rpi4",
    strip_prefix = "openwrt-imagebuilder-22.03.5-bcm27xx-bcm2711.Linux-x86_64",
    url = "https://downloads.openwrt.org/releases/22.03.5/targets/bcm27xx/bcm2711/openwrt-imagebuilder-22.03.5-bcm27xx-bcm2711.Linux-x86_64.tar.xz",
    sha256 = "b117eb6346546a7326cb338363c102a8afe5df1228a1ab89f0bccb5e3c92c9c4",
    build_file = "@//:BUILD.imagebuilder.bazel",
)
