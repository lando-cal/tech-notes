Linux Logical Volume Manager.
- Tutorial [http://linuxconfig.org/Linux_lvm_-_Logical_Volume_Manager](http://linuxconfig.org/Linux_lvm_-_Logical_Volume_Manager)
- Overview - [http://www.centos.org/docs/5/html/Cluster_Logical_Volume_Manager/LVM_definition.html](http://www.centos.org/docs/5/html/Cluster_Logical_Volume_Manager/LVM_definition.html)
- Managing - [http://www.centos.org/docs/5/html/Cluster_Logical_Volume_Manager/VG_admin.html](http://www.centos.org/docs/5/html/Cluster_Logical_Volume_Manager/VG_admin.html)

Physical volumes (pv) are grouped into volume groups (vg). Volume groups are sliced up into logical volumes (lv).

# Examples
## Show a bunch of info

```
pvdisplay -v \
pvs -v \
pvs -a \
pvs --segments \
vgdisplay -v \
vgs -v \
vgs -a -o +devices
```

## Show system disks and if they are in an LVM
`lvmdiskscan`

## Show all logical volumes
`lvs`

## Activate all volume groups
`vgchange -a y`

## Create a physical volume
physical volumes are groups of physical disks that can be used to create logical volumes

`pvcreate pv_name /dev/sdb2 /dev/sdc2`

## Create a logical volume
This creates a specifically named logical volume on a volume group named vg_data

`lvcreate -L 10G -n lv_name vg_data`

## Show how each logical volume is set up
`lvdisplay`

## Show free extents
`vgs -o vg_free_count`

## Extend a volume group to 1TB
`lvextend -L 1T /dev/vgroot/lv_srv && resize2fs /dev/mapper/vgroot-lv_srv && df -h /srv`

## Extend a volume group to its max
`lvextend -l +100%FREE /dev/vgroot/lv_srv && resize2fs /dev/mapper/vgroot-lv_srv && df -h /srv`
