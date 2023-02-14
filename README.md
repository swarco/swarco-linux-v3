SWARCO Embedded Linux V3.1 operating system
===========================================

<img src="https://www.swarco.com/sites/default/files/public/product/2018-11/primos_scc_frei.png" width="200" title="SWARCO CCM2200 CPU" alt="">


## Feature comparison SWARCO Linux V2, V3 and V3.1

| Feature              | SWARCO Linux V2       | SWARCO Linux V3                                          | SWARCO Linux V3.1                |
|----------------------|-----------------------|----------------------------------------------------------|----------------------------------|
| Hardware             | CCM2200               | SCC-Air Mk II, SCC-Air, CCM2200, 5 Port Router,  &#8230; | SCC-Air Mk II, CCM2200           |
| first release        | 2007                  | December 2017                                            | February 2023                    |
| based on Buildroot   | 20081211              | &ge; 2016.05                                             | &ge; 2022.02                     |
| CPU architecture     | ARM                   | ARM                                                      | Cortex-A5 (SCC), arm920t (CCM)   |
| min. instruction set | ARMv4T, arm920t       | ARMv4T, arm920t                                          | Cortex-A5+VFPv4-D16, ARMv4T(CCM) |
| ABI                  | OABI                  | EABI                                                     | EABI                             |
| Linux-Kernel         | 3.4.113 (opt. 2.6.21) | SCC-Air-v2 4.9.47 <br> SCC-Air 3.3 <br> CCM2200: 3.4.113 | SCC: 5.4.137, CCM: 3.4           |
| C-Library            | uClibc version 0.9.29 | glibc version &ge; 2.22                                  | glibc version &ge; 2.34          |
| Thread library       | linuxthreads          | glibc NPTL                                               | glibc NPTL                       |
| Binutils version     | 2.18                  | &ge; 2.26                                                | &ge; 2.36.1                      |
| gcc version          | 4.2.3                 | 4.9.x / 6.x                                              | 11.x / 12.x                      |
| C++ standard         | C++98                 | C++11                                                    | C++20                            |
|                      |                       |                                                          |                                  |

## Compilation for target CPUs using Docker

**2020-04-08: This is the recommended way to build toolchains and target CPU images with current Linux distributions **


### Building Docker Images (@todo currently not supported for V3.1)

Build images for SCC-Air-v2 hardware:

    docker build -f docker/all/Dockerfile -t swarco/swarco-linux-v3-scc-air-v2 --build-arg BUILDROOT_CONFIG=swarco_linux_v3_scc-air-v2_sama5_defconfig   .

Build images for SCC-SAMA5 5 Port Router hardware:

    docker build -f docker/all/Dockerfile -t swarco/swarco-linux-v3-scc-5port-sama5 --build-arg BUILDROOT_CONFIG=swarco_linux_v3_scc_5port_sama5_defconfig   .

Build images for SCC-Air hardware:

    docker build -f docker/all/Dockerfile -t swarco/swarco-linux-v3-scc-air --build-arg BUILDROOT_CONFIG=swarco_linux_v3_scc_air_defconfig   .

Build images for CCM2200 hardware:

    docker build -f docker/all/Dockerfile -t swarco/swarco-linux-v3-ccm2200 --build-arg BUILDROOT_CONFIG=swarco_linux_v3_ccm2200_defconfig   .


### Extract root-fs and kernel images for installation on target CPU from Docker image

    docker cp <CONTAINER ID>:/home/builduser/swarco-linux-v3/output/images .


## Compilation for CCM2200 CPU, SCC-Air CPU and SAMA5 5Port Router on host Linux

:warning: **Warning: This method will not work with the tools in current Linux distributions .
Recommended Linux distribution is Debian 8 Jessie **


Or prepare SCC-Air-Mk-II configuration:

    make swarco_linux_v3.1_scc-air-v2_sama5_defconfig

Or prepare SCC-SAMA5 5 port router configuration: (@todo currently not supported)

    make swarco_linux_v3.1_scc_5port_sama5_defconfig

Or prepare SCC-Air configuration: (@todo currently not supported)

    make swarco_linux_v3.1_scc_air_defconfig

Prepare CCM2200 configuration:

    make swarco_linux_v3.1_ccm2200_defconfig
    

Compile toolchain, packages, kernel, build rootfs:

    make
    
Then images for the CC2200 CPU are found under 

- Linux kernel image: output/images/uImage-ccm2200-ubifs.bin
- Rootfs image: output/images/rootfs-ccm2200-lp.arm.ubifs

## License Information 

This is a fork of the Buildroot GIT repository (from
[http://git.buildroot.net/buildroot](http://git.buildroot.net/buildroot)) which is a base for the SWARCO
Embedded Linux V3 operating system used on the SCC-Air-Mk-II, SCC-Air, CCM2200 and
other similar SWARCO CPUs.

Buildroot itself and all files in this repository contributed by
SWARCO are licensed under the
[GNU General Public License, version 2](http://www.gnu.org/licenses/old-licenses/gpl-2.0.html)
or (at your option) any later version, with the exception of the
package patches.

Buildroot also bundles patch files, which are applied to the sources
of the various packages. Those patches are not covered by the license
of Buildroot. Instead, they are covered by the license of the software
to which the patches are applied. When said software is available
under multiple licenses, the Buildroot patches are only provided under
the publicly accessible licenses.

The packages included in Buildroot and SWARCO Linux are licensed under
various open source licenses.  Some licenses require you to publish
the license text in the documentation of your product. Others require
you to redistribute the source code of the software to those that
receive your product. Please refer the Buildroot documentation and the
license documentation of each used package when distributing a product
based on this software.


