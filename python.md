# Tips and techniques

## Upgrade pip packages:

```
pip install pip-tools
pip-review --interactive
```

## Import module from absolute path

```
sys.path.append('/Users/username/code/somedir')
import module # from somedir
```

## Print variables from the local scope

```
for var in dir():
    print "Debug: {0} = {1}".format(var,eval(var))
```

## Inspect things

```
>>> import inspect
>>> inspect.getargspec(inspect.getargspec)
ArgSpec(args=['func'], varargs=None, keywords=None, defaults=None)
```

## Decorators

- <https://wiki.python.org/moin/PythonDecoratorLibrary>
- <http://stackoverflow.com/questions/739654/how-can-i-make-a-chain-of-function-decorators-in-python/1594484#1594484>
- <http://ains.co/blog/things-which-arent-magic-flask-part-1.html>

# Various links

- [Dive Into Python 3](http://www.diveintopython3.net/)
- [How to Think Like a Computer Scientist](http://interactivepython.org/courselib/static/thinkcspy/index.html) - iPython notebook on python data science
- [A gallery of interesting IPython Notebooks](https://github.com/ipython/ipython/wiki/A-gallery-of-interesting-IPython-Notebooks)
- [Learn Python dot org]<http://www.learnpython.org/>
