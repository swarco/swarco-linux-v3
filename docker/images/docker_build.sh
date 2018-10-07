#!/bin/bash

set -e -x
id


cd swarco-linux-v3

# "clone" repository swarco-linux-v3-dl in exisiting directory "output"
(
    cd output
    git init
    git remote add origin https://github.com/swarco/swarco-linux-v3-dl
    git pull --depth 1 origin master
)

make

(
    cd output/images
    tar cJf ../../../swarco-linux-v3_images.tar.bz2 .
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
    mkdir -p linux-v3.4.113-ccm2200/arch/arm/boot/
    cp -p  ../images/uImage-ccm2200-ubifs.bin linux-v3.4.113-ccm2200/arch/arm/boot/uImage-ccm2200-ubifs.bin
)

# remove download directory, so it will not be part of the created Docker image
rm -rf output/dl output/.git

#(
    #    tar cJf ../swarco-linux-v2_staging_dir.tar.bz2 buildroot/buildroot-2.0/build_arm/staging_dir
#)
pwd
# mv swarco-linux-v3/output/host .
# ls -l

# # remove swarco-linux-v3 build directory after build to prevent too
# # large Docker image
# rm -rf swarco-linux-v3

# mkdir -p swarco-linux-v3/output
# mv host swarco-linux-v3/output/

ls -l
cd ..

