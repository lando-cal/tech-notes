"networksetup -- configuration tool for network settings in System Preferences." - `man networksetup`

`networksetup` is a standard tool on [osx](osx)

# Examples

## shows the relevant info for the device named Wi-Fi

```
networksetup -getinfo "Wi-Fi"
```

## shows all connected hardware ports

```
networksetup -listallhardwareports
```

## Show all search domains

```
networksetup -listallnetworkservices |
  tail -n +2 |
  xargs -I :: networksetup -getsearchdomains "::"
```

## Create a bunch of VLAN interfaces

```
for X in {1..32} ; do
  sudo networksetup -createVLAN "vlan${X}" en3 "${X}" ;
done ;
```

## Delete a bunch of VLAN interfaces

```
for X in {1..32} ; do
  sudo networksetup -deleteVLAN "vlan${X}" en3 "${X}" ;
done ;
```
