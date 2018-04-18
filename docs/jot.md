Title: jot

jot is a BSD CLI tool to generate sequences or random data, usually numbers.

# Tricks

## Generate 37 evenly space floating point numbers (with two significant digits) between -10 and +10

```
jot 37 -10 10.00
```

## Generate two 12 alphanumeric random character passwords with rs

```
jot -rc 24 48 123 | rs -g 0 12
```

## Generate 5 capital alphanumeric strings

```
jot -rc 500 48 90 | grep '[A-Z0-9]' | rs -g 5 32
```
