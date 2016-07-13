This is a fork of the Buildroot GIT repository (from http://git.buildroot.net/buildroot)
which is a base for the SWARCO Embedded Linux V3 operating system used on the
CCM2200 and CCMxCORE CPUs.

# Feature comparison SWARCO Linux V2 vs. V3


| Feature              | **SWARCO Linux V2**   | SWARCO Linux V3                     |
|----------------------|-----------------------|-------------------------------------|
| Hardware             | CCM2200               | CCM2200, CCMxCORE, …                |
| first release        | 2007                  | planed for 2016                     |
| based on Buildroot   | 2008-12-11            | &gt;= 2016.05                       |
| CPU Architecture     | ARM                   | ARM                                 |
| min. Instruction Set | ARMv4T, arm920t       | ARMv4T, arm920t                     |
| ABI                  | OABI                  | EABI                                |
| Linux-Kernel         | 2.6.21 (opt. 3.4)     | CCMxCORE: 4.0 <br> CCM2200: 3.4.17  |
| Buildroot Version    | 20081211              | &gt;= 2016.05                       |
| C-Library            | uClibc version 0.9.29 | glibc version &gt;= 2.22            |
| Thread Library       | linuxthreads          | glibc NPTL                          |
| Binutils Version     | 2.18                  | &gt;= 2.26                          |
| gcc Version          | 4.2.3                 | 4.9.x / 6.x                         |
| C++ Standard         | C++98                 | C++11                               |
|                      |                       |                                     |
