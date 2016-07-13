SWARCO Embedded Linux V3 operating system
=========================================

![](data:image/jpeg;base64,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 "SWARCO CCM2200 CPU")


## Feature comparison SWARCO Linux V2 vs. V3

| Feature              | SWARCO Linux V2       | SWARCO Linux V3                     |
|----------------------|-----------------------|-------------------------------------|
| Hardware             | CCM2200               | CCM2200, CCMxCORE, &#8230;          |
| first release        | 2007                  | planed for 2016                     |
| based on Buildroot   | 2008-12-11            | &ge; 2016.05                        |
| CPU architecture     | ARM                   | ARM                                 |
| min. instruction set | ARMv4T, arm920t       | ARMv4T, arm920t                     |
| ABI                  | OABI                  | EABI                                |
| Linux-Kernel         | 2.6.21 (opt. 3.4.17)  | CCMxCORE: 4.0 <br> CCM2200: 3.4.17  |
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


