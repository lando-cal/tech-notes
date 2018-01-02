"A utility to accurately report the in core memory usage for a program." - <https://github.com/pixelb/ps_mem>

# Usage examples

## Simple usage

```
$ sudo ps_mem
 Private  +   Shared  =  RAM used    Program

144.0 KiB +  12.5 KiB = 156.5 KiB    acpid
144.0 KiB +  31.5 KiB = 175.5 KiB    hald-addon-acpi
160.0 KiB +  56.5 KiB = 216.5 KiB    hald-addon-input
...snip...
 17.9 MiB + 101.0 KiB =  18.0 MiB    mysqld [updated]
 25.5 MiB + 516.5 KiB =  26.0 MiB    salt-minion
 31.6 MiB + 730.0 KiB =  32.3 MiB    python (2)
 41.0 MiB + 309.5 KiB =  41.3 MiB    ruby
 45.5 MiB +  36.0 KiB =  45.6 MiB    init
 48.9 MiB +   4.1 MiB =  53.0 MiB    ssh (48)
 57.3 MiB +   2.5 MiB =  59.7 MiB    bash (114)
115.0 MiB +  86.0 KiB = 115.1 MiB    named
148.3 MiB + 132.5 KiB = 148.4 MiB    java
  1.4 GiB + 449.5 KiB =   1.4 GiB    screen (15)
---------------------------------
                          2.0 GiB
=================================
```
