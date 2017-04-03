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

### Use venv to work around missing pip

This is mostly useful for installing for your user, since if you can't install pip you won't be able to install into system-wide locations.

```
virtualenv venv --system-site-packages && venv/bin/pip install --user $PACKAGENAME && rm -rf venv
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

<https://docs.python.org/3/using/cmdline.html#envvar-PYTHONVERBOSE>

```
export PYTHONVERBOSE=1
# or...
python -v pip search beets
```

## Follow the flow of a python script

This is equivalent to `bash -x` / `bash -o xtrace`, but is probably even more useful because it prefixes the name of the file and the line number to what is actually being executed, which aids in debugging large projects.

```
python -m trace --trace foo.py
```

## Enter an interactive prompt after script ends

<https://docs.python.org/3/using/cmdline.html#envvar-PYTHONINSPECT>

This works when your code causes an exception, but none of your code will actually be executed, you will simply be dropped into a shell, which is not very useful.

```
export PYTHONINSPECT=1
# or...
sudo python -i ./ps_mem.py
```

## Enter a python terminal arbitrarily

<https://docs.python.org/3/library/pdb.html>

```
import pdb; pdb.set_trace()
```

After inspecting...

```
continue
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

- [A gallery of interesting Jupyter and IPython Notebooks](https://github.com/jupyter/jupyter/wiki/A-gallery-of-interesting-Jupyter-and-IPython-Notebooks)
- [Drag'n'drop Pivot Tables and Charts in Jupyter](http://nicolas.kruchten.com/content/2015/09/jupyter_pivottablejs/)
- [Code Like a Pythonista: Idiomatic Python](http://python.net/~goodger/projects/pycon/2007/idiomatic/handout.html)
- [Dive Into Python 3](http://www.diveintopython3.net/)
- [Google's Python Class](https://developers.google.com/edu/python/?csw=1)
- [How to Think Like a Computer Scientist](http://interactivepython.org/courselib/static/thinkcspy/index.html) - iPython notebook on python data science
- [Intermediate and Advanced Software Carpentry in Python](http://ivory.idyll.org/articles/advanced-swc/)
- [Learn Python dot org](http://www.learnpython.org/)
- [Python Cheatsheets](https://www.pythonsheets.com)
- [The Flask Mega-Tutorial](https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world)
- [The Python IAQ: Infrequently Answered Questions](http://norvig.com/python-iaq.html)
- [Why I use py.test and you probably should too](http://halfcooked.com/presentations/pyconau2013/why_I_use_pytest.html)

## Decorator links

- <https://wiki.python.org/moin/PythonDecoratorLibrary>
- <http://stackoverflow.com/questions/739654/how-can-i-make-a-chain-of-function-decorators-in-python/1594484#1594484>
- <http://ains.co/blog/things-which-arent-magic-flask-part-1.html>

## Modules

- <https://github.com/jonathanslenders/ptpython> - improved python REPL
- <https://docs.python.org/3/library/sched.html> - cross-platform cron-like scheduler
- <https://pypi.python.org/pypi/colorama> - cross-platform colorized terminal output
- <https://pypi.python.org/pypi/begins/> - Simplified CLI arguments
- <https://pypi.python.org/pypi/watchdog> - cross-platform filesystem events API
- <https://github.com/giampaolo/psutil/> - system information
- <https://github.com/timothycrosley/hug> - simplified web API creation
