Title: python

"Python is a programming language that lets you work more quickly and integrate your systems more effectively." - <https://www.python.org/>

# Tips and techniques

- Don't use `assert` statements for regular validation. `assert` statements can be disabled at the interpreter level, which would vastly change the flow of your code if they were used widespread.

## Variable names

- `_varname` - Semi-private. Basically a convention that developers use to indicate that the scope of a variable is local, but this locality is not enforced by the interpreter.
- `__varname` - Private variable in name, but not in logic or security. The interpreter mangles the name of the var to make it globally unique, but it is still globally accessible.
- `var_` - Used to get around shadowing built-in variable names. EG: `list_` won't conflict with `list()`
- `__magic_method__` - See <http://www.diveintopython3.net/special-method-names.html>

## Virtual Environments

Virtual environments isolate your project away from the system's python interpreter and modules, so you can have full control over what code is available to your project. This makes it easy to develop, debug, and deploy to a new system. It's basically always a good idea to use a virtual environment. You will thank yourself later by learning this one up front.

### Virtual environments using venv

#### Creating a venv

```
echo "venv" >> .gitignore
virtualenv venv
. venv/bin/activate
pip install requests
pip freeze > requirements.txt
# write code, interact with it, whatever
deactivate
```

#### Recreating a venv

```
virtualenv venv
. venv/bin/activate
pip install -r requirements.txt
# write code, interact with it, whatever
deactivate
```

#### Use venv to work around missing pip

This is mostly useful for installing for your user, since if you can't install pip you won't be able to install into system-wide locations.

```
virtualenv venv --system-site-packages && venv/bin/pip install --user $PACKAGENAME && rm -rf venv
```

### Virtual environments with pipenv

"Pipenv — the officially recommended Python packaging tool from Python.org, free (as in freedom). Pipenv is a tool that aims to bring the best of all packaging worlds (bundler, composer, npm, cargo, yarn, etc.) to the Python world. Windows is a first-class citizen, in our world." - <https://docs.pipenv.org>

`pipenv` is the new-school 2017 way of doing virtual environments. pipenv creates a file called `Pipfile` whenever you install packages using the `pipenv` command. Once you have created a pipenv for the CWD, any subdirs will use that pipenv and not create new environments when you issue pipenv commands. This is a more robust system, but as of 2017 is not widely used.

When using pipenv, any packages using `pip install` are not included in the virtual environment. You must use `pipenv install`.

#### Creating a virtual environment using pipenv

```
cd project_dir
pipenv --three  # to create a python 3 virtual environment
pipenv install bpython boto3
pipenv shell  # this spawns a subshell with the new python environment
# interact with your python environment
exit
```

#### Recreate a pipenv

```
cd project_dir
pipenv shell  # This automatically enforces the environment described in Pipfile
# interact with your python environment
exit
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

## Create an http server using PWD as document root

```
python3 -m http.server 9980
```

or...

```
python2 -m SimpleHTTPServer 9980
```

## Discover the location for pip --user installs

```
echo $(python -m site --user-base)/bin
```

# Various links

- [A gallery of interesting Jupyter and IPython Notebooks](https://github.com/jupyter/jupyter/wiki/A-gallery-of-interesting-Jupyter-and-IPython-Notebooks)
- [Drag'n'drop Pivot Tables and Charts in Jupyter](http://nicolas.kruchten.com/content/2015/09/jupyter_pivottablejs/)
- [Code Like a Pythonista: Idiomatic Python](http://python.net/~goodger/projects/pycon/2007/idiomatic/handout.html)
- [Dive Into Python 3](http://www.diveintopython3.net/)
- [Google's Python Class](https://developers.google.com/edu/python/?csw=1)
- [Google Python Style Guide](https://google.github.io/styleguide/pyguide.html)
- [How to Think Like a Computer Scientist](http://interactivepython.org/courselib/static/thinkcspy/index.html) - iPython notebook on python data science
- [Intermediate and Advanced Software Carpentry in Python](http://ivory.idyll.org/articles/advanced-swc/)
- [Learn Python dot org](http://www.learnpython.org/)
- [Python Cheatsheets](https://www.pythonsheets.com)
- [The Flask Mega-Tutorial](https://blog.miguelgrinberg.com/post/the-flask-mega-tutorial-part-i-hello-world)
- [The Python IAQ: Infrequently Answered Questions](http://norvig.com/python-iaq.html)
- [Why I use py.test and you probably should too](http://halfcooked.com/presentations/pyconau2013/why_I_use_pytest.html)
- [PyCon 2017 videos](https://www.youtube.com/channel/UCrJhliKNQ8g0qoE_zvL8eVg)
- [PyCon 2018 videos](https://www.youtube.com/channel/UCsX05-2sVSH7Nx3zuk3NYuQ)
- [Cookiecutter: Better Project Templates](https://cookiecutter.readthedocs.io/en/latest/) / [A pantry full of cookiecutters](https://cookiecutter.readthedocs.io/en/latest/readme.html#a-pantry-full-of-cookiecutters)

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
- <http://python-future.org> - "python-future is the missing compatibility layer between Python 2 and Python 3. It allows you to use a single, clean Python 3.x-compatible codebase to support both Python 2 and Python 3 with minimal overhead."
- <https://caremad.io/posts/2013/07/setup-vs-requirement/> - Hard vs abstract dependencies in requirements.txt (and by extension Pipfile) vs setup.py
