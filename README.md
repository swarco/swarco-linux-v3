SWARCO Embedded Linux V3 operating system
=========================================

<img src="https://www.swarco.com/var/em_plain_site/storage/images/media/images/swarco-traffic-systems/interurban/primos/primos_compact_ohnetouch_grau/1166093-1-eng-US/Primos_Compact_ohneTouch_grau_315px.jpg" width="200" title="SWARCO CCM2200 CPU" alt="">


## Feature comparison SWARCO Linux V2 vs. V3

| Feature              | SWARCO Linux V2       | SWARCO Linux V3                     |
|----------------------|-----------------------|-------------------------------------|
| Hardware             | CCM2200               | CCM2200, CCMxCORE, &#8230;          |
| first release        | 2007                  | planed for 2016                     |
| based on Buildroot   | 2008-12-11            | &ge; 2016.05                        |
| CPU architecture     | ARM                   | ARM                                 |
| min. instruction set | ARMv4T, arm920t       | ARMv4T, arm920t                     |
| ABI                  | OABI                  | EABI                                |
| Linux-Kernel         | 3.4.113 (opt. 2.6.21) | CCMxCORE: 4.0 <br> CCM2200: 3.4.113 |
| Buildroot version    | 20081211              | &ge; 2016.05                        |
| C-Library            | uClibc version 0.9.29 | glibc version &ge; 2.22             |
| Thread library       | linuxthreads          | glibc NPTL                          |
| Binutils version     | 2.18                  | &ge; 2.26                           |
| gcc version          | 4.2.3                 | 4.9.x / 6.x                         |
| C++ standard         | C++98                 | C++11                               |
|                      |                       |                                     |

## Compilation for CCM2200 CPU

Prepare CCM2200 configuration:

    make swarco_linux_v3_ccm2200_defconfig
    
Compile toolchain, packages, kernel, build rootfs:

    make
    
Then images for the CC2200 CPU are found under 

- Linux kernel image: output/images/uImage (must be renamed to uImage-ccm2200dev.bin)
- Rootfs image: output/images/rootfs.jffs2 (must be renamed to rootfs-ccm2200-lp-nand.jffs2)

## License Information 

This is a fork of the Buildroot GIT repository (from
[http://git.buildroot.net/buildroot](http://git.buildroot.net/buildroot)) which is a base for the SWARCO
Embedded Linux V3 operating system used on the CCM2200 and CCMxCORE
CPUs.

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


