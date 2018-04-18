Title: GNU GRUB

"GNU GRUB is a Multiboot boot loader. It was derived from GRUB, the GRand Unified Bootloader, which was originally designed and implemented by Erich Stefan Boleyn." - <https://www.gnu.org/software/grub/>

# Examples

## Disable onboard frame buffer

I used this configuration to get text mode linux to boot on a Mac Mini with a bad graphics card that would not load a desktop environment. The machine was locking up at boot in OS X. Hardware test would boot with a striped color anomalies, but would never finish. Ubuntu Xenial would not boot correctly even to text mode without these settings.

In `/etc/default/grub`:

```
GRUB_CMDLINE_LINUX_DEFAULT="video=vesafb:off nofb vga=normal nomodeset"
```

# Notable commands, files and dirs

- `/boot/grub/grub.cfg` - The grub config that is actually used at boot
- `/etc/grub.d` - A directory with some of the configs that are combined to create /boot/grub/grub.cfg
- `/etc/default/grub` - Default grub options
- `update-grub` - Used to regenerate `/boot/grub/grub.cfg`
- `grub-set-default` - Used to configure the default menu entry during reboot, only for bare metal machines
- `grub-set-default-legacy-ec2` - Used to configure the default menu entry on ec2 machines grub-set-default-legacy-ec2
