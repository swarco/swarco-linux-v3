#!/bin/bash

set -e -x
id

# make shallow clone
git clone --depth 1 https://github.com/swarco/swarco-linux-v3

cd swarco-linux-v3

# make shallow clone
git clone --depth 1 https://github.com/swarco/swarco-linux-v3-dl output

make swarco_linux_v3_ccm2200_defconfig

# disable toolchain locale support
# sed -i -e "s/BR2_ENABLE_LOCALE=y/# BR2_ENABLE_LOCALE is not set/g" .config
# grep ^BR2_ENABLE_LOCALE .config
# make oldconfig
# grep ^BR2_ENABLE_LOCALE .config
# locale -a

# substitute  grep -q -i utf8 in  grep -q -i utf-\\\?8
sed -i -e 's/utf8/utf-\\\\\\?8/g' support/dependencies/dependencies.sh
cat support/dependencies/dependencies.sh

make toolchain
# build host-gdb if configured
if grep -e 'BR2_PACKAGE_HOST_GDB=y' .config  ; then
    make host-gdb
fi


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

