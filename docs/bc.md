# GNU bc

[bc](bc "wikilink") is a tool that does math on the CLI.

# Examples

## Divide one number into another and show two decimal places

The `scale` variable sets the number of significant digits.

`echo "scale=2 ; 7 / 3" | bc`

## Convert decimal to hexadecimal

`echo "obase=16 ; 10" | bc`

## Convert hexadecimal to binary

`echo "ibase=16 ; obase=2 ; AF" | bc`

## Subtract two from the last octet of a MAC address

```
echo 24:b6:fd:ff:ba:31 |
while read -r X ; do
  echo ${X%??}$(
    echo "obase=16 ; $(( 0x${X#*:??:??:??:??:} )) - 2" |
      bc |
      sed 's/^\(.\)$/0\1/' |
      tr A-Z a-z
  ) ;
done ;
```
