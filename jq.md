"jq is a lightweight and flexible command-line JSON processor." - [https://stedolan.github.io/jq/](https://stedolan.github.io/jq/)

# Examples
## Pretty print a json file

```
cat foo.json | jq .
```

## Grab the first element of an array, and print the 'timestamp' field of that element.

```
cat foo.json | jq -s '.[0] | {timestamp}'
```

## Use mco to find packages of a certain version on a certain OS

```
mco rpc package status package=apt -j -F lsbdistcodename=trusty | jq -c '.[] | select(.data.ensure == "1.0.1ubuntu2") | { version: .data.ensure, hostname: .sender }'
```

## Other misc examples

```
jq '.[] | select(.data.ensure != "purged") | [.sender,.data.ensure]' $*
```

# See Also
- [Tutorial](https://stedolan.github.io/jq/tutorial/)
