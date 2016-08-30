# Tips and techniques

## Virtual Environments

Virtual environments isolate your project away from the system's python interpreter and modules, so you can have full control over what code is available to your project. This makes it easy to develop, debug, and deploy to a new system. It's basically always a good idea to use a virtual environment. You will thank yourself later by learning this one up front.

### Creating a venv

```
echo "venv" >> .gitignore
virtualenv venv
. venv/bin/activate
pip install requests
pip freeze > requirements.txt
# write code, interact with it, whatever
deactivate
```

### Recreating a venv

```
virtualenv venv
. venv/bin/activate
pip install -r requirements.txt
# write code, interact with it, whatever
deactivate
```

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

# Debugging

## Verbose environment var

At your shell, run `export PYTHONVERBOSE=1`

## Follow the flow of a python script

This is equivalent to `bash -x` / `bash -o xtrace`, but is probably even more useful because it prefixes the name of the file and the line number to what is actually being executed, which aids in debugging large projects.

```
python -m trace --trace foo.py
```

## Enter an interactive prompt after script ends

This works when your code causes an exception, but none of your code will actually be executed, you will simply be dropped into a shell, which is not very useful.

```
sudo python -i ./ps_mem.py
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

# Various links

- [Dive Into Python 3](http://www.diveintopython3.net/)
- [How to Think Like a Computer Scientist](http://interactivepython.org/courselib/static/thinkcspy/index.html) - iPython notebook on python data science
- [A gallery of interesting IPython Notebooks](https://github.com/ipython/ipython/wiki/A-gallery-of-interesting-IPython-Notebooks)
- [Learn Python dot org](http://www.learnpython.org/)

## Decorator links

- <https://wiki.python.org/moin/PythonDecoratorLibrary>
- <http://stackoverflow.com/questions/739654/how-can-i-make-a-chain-of-function-decorators-in-python/1594484#1594484>
- <http://ains.co/blog/things-which-arent-magic-flask-part-1.html>
