Title: Hashids

"Hashids is a small open-source library that generates short, unique, non-sequential ids from numbers. It converts numbers like 347 into strings like 'yr8', or array of numbers like `[27, 986]` into '3kTMd'. You can also decode those ids back. This is useful in bundling several parameters into one or simply using them as short UIDs." - <https://hashids.org/>

# Examples

## Python

<https://github.com/davidaurelio/hashids-python>

```
from hashids import Hashids
hashids = Hashids(salt="this is my salt")
id = hashids.encode(1, 2, 3)  # str('laHquq')
numbers = hashids.decode(id)
```
