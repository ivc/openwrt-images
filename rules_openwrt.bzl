"""Rules for building OpenWrt images"""

def _openwrt_image_impl(ctx):
    ctx.actions.run(
        executable = ctx.executable.image_builder,
        inputs = ctx.attr.srcs.files,
        outputs = [
            ctx.outputs.ext4,
            ctx.outputs.squashfs,
        ],
        env = {
            "BIN_DIR": ctx.bin_dir.path,
            "BUILDROOT": ctx.attr.srcs.files.to_list()[0].dirname,
            "IMAGE_PREFIX": ctx.label.name + "-",
            "IMAGE_SIZE": str(ctx.attr.size),
            "PACKAGES": " ".join(ctx.attr.packages),
            "PATH": "/usr/bin:/bin",
            "PROFILE": ctx.attr.profile,
        },
    )

openwrt_image = rule(
    implementation = _openwrt_image_impl,
    attrs = {
        "srcs": attr.label(
            allow_files = True,
            doc = "Image builder source files",
            mandatory = True,
        ),
        "profile": attr.string(
            doc = "Image profile to use",
            mandatory = True,
        ),
        "packages": attr.string_list(
            doc = "List of packages to install",
        ),
        "size": attr.int(
            doc = "Root filesystem size in MB",
        ),
        "image_builder": attr.label(
            default = Label("//:image_builder"),
            executable = True,
            allow_files = True,
            cfg = "exec",
        ),
    },
    outputs = {
        "ext4": "%{name}-root.ext4.gz",
        "squashfs": "%{name}-root.squashfs.gz",
    },
)
