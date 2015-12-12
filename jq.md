"jq is a lightweight and flexible command-line JSON processor." - [https://stedolan.github.io/jq/](https://stedolan.github.io/jq/)

# Examples
## Pretty print a json file

```
cat foo.json | jq .
```

# Grab the first element of an array, and print the 'timestamp' field of that element.

```
cat foo.json | jq -s '.[0] | {timestamp}'
```

# See Also
- [Tutorial](https://stedolan.github.io/jq/tutorial/)
