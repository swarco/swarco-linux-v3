#!/bin/bash

set -e -x
echo "ARG: $1"
echo "BUILDROOT_CONFIG: $BUILDROOT_CONFIG"
id
pwd
cat /etc/debian_version 
unset BUILDROOT_CONFIG
export BUILDROOT_CONFIG

# make shallow clone
#git clone --depth 1 https://github.com/swarco/swarco-linux-v3

#cd swarco-linux-v3

# make shallow clone
#git clone --depth 1 https://github.com/swarco/swarco-linux-v3-dl output

CONFIG=${1-swarco_linux_v3_ccm2200_defconfig}
echo "Using Config: ${CONFIG}"

make ${CONFIG}
make -j

(
    cd output/images
    tar cjf ../../../swarco-linux-v3.1_images.tar.bz2 .
)

# cleanup build dir so it will not be part of the created Docker image
(
    cd output/build
    for dir in *
    do
        if [ -d "$dir" ]; then
            echo "cleanup directory $dir"
            rm -rf "$dir"
            mkdir "$dir"
            # fake stamp files, so buildroot don't try to rebuild this
            # directory
            (cd "$dir"; touch .applied_patches_list         \
                              .br_filelist_after            \
                              .br_filelist_before           \
                              .gitignore                    \
                              .config                       \
                              .stamp_built                  \
                              .stamp_configured             \
                              .stamp_downloaded             \
                              .stamp_extracted              \
                              .stamp_patched                \
                              .stamp_staging_installed      \
                              .stamp_kconfig_fixup_done     \
                              .stamp_host_installed         \
                              .stamp_target_installed )         
        fi
    done
)

# remove download directory, so it will not be part of the created Docker image
rm -rf output/dl output/.git

#test cross compiler

PATH=$PATH:$PWD/output/host/usr/bin/
export PATH

echo -e '#include <stdio.h>\nint main() { printf("Hello\\n"); }' >hello.c
pwd
ls -l

arm-buildroot-linux-gnueabi-gcc -o hello hello.c



echo Oki Doki

