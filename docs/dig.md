dig (domain information groper) is a flexible tool for interrogating DNS name servers. The syntax for this tool is a bit cryptic and is not standard.

# Usage

## Simple usage

```
dig yelp.com
```

## Show only the Answer section

```
dig +noall +answer "yelp.com"
```

## Trace a query from the root servers

This is the most accurate way to get a DNS record as it will appear to anybody else on the internet who has not queried it before, and will show you all the DNS steps involved in the resolution.

```
dig +trace yelp.com
```
