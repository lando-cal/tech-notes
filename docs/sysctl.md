Title: sysctl

"sysctl - configure kernel parameters at runtime" - man sysctl

`/etc/sysctl.conf` is for storing permanent changes, `sysctl` is used for making changes to the running system.

# sysctl command examples

## Show all kernel variables for the in-memory kernel

```
sysctl -a
```

## Assign a new variable for the running kernel to use

```
sysctl -w variable=value
```

## Load values from /etc/sysctl.conf

```
sysctl -p
```

# sysctl.conf examples

## Reboot after 10 seconds if kernel panics

```
kernel.panic = 10
```

## Treat all oopses as panics

```
kernel.panic_on_oops = 1
```
