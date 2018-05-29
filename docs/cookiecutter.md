Title: cookiecutter

# Examples

## Find a list of cookiecutter variables

```
grep -h -o '{{cookiecutter[^}]*}}' \{\{cookiecutter.repo_name\}\}/* | sort | uniq -c
```

# Links

- [Cookiecutter: Better Project Templates](https://cookiecutter.readthedocs.io/en/latest/)
- [A pantry full of cookiecutters](https://cookiecutter.readthedocs.io/en/latest/readme.html#a-pantry-full-of-cookiecutters)
