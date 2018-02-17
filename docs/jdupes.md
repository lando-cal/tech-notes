"finds and performs actions upon duplicate files" - `man jdupes`

`jdupes` is based on `fdupes` and is not written in java as the name may lead you to assume.

# Examples

## Recursively find all duplicates in a dir

```
jdupes -r /path/to/dir
```

## Create hard-links of any duplicate files

```
jdupes -r -L /path/
```

# Links

- <https://github.com/jbruchon/jdupes>
