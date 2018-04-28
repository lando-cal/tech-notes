Title: ethtool

"ethtool - query or control network driver and hardware settings" - `man ethtool`

# Examples

## Force ethernet adapter to re-negotiate its speed

```
ethtool -r
```

## Show interface error count by type

```
$ sudo ethtool -S ens5f0 | grep -i error
     rx_errors: 13551
     tx_errors: 0
     rx_length_errors: 0
     rx_crc_errors: 13551
     fcoe_last_error: 0
     port.tx_errors: 0
     port.rx_crc_errors: 13551
     port.rx_length_errors: 0
```
