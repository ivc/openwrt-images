#!/bin/bash
set -ex
(
    cd "$BUILDROOT"
    make image PROFILE=$PROFILE \
        ${IMAGE_SIZE:+ROOTFS_PARTSIZE=$IMAGE_SIZE} \
        ${PACKAGES:+PACKAGES="$PACKAGES"} \

)
for src in "$BUILDROOT"/build_dir/*/*/root.*; do
    dst="${BIN_DIR}/${IMAGE_PREFIX}$(basename "$src")"
    mv "$src" "$dst"
    gzip "$dst"
done
