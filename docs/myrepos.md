"You have a lot of version control repositories. Sometimes you want to update them all at once. Or push out all your local changes. You use special command lines in some repositories to implement specific workflows. Myrepos provides a mr command, which is a tool to manage all your version control repositories." -- [http://myrepos.branchable.com/](http://myrepos.branchable.com/)

# Usage Examples
## Register a bunch of repos

```
for repo in ~/code/* ; do
  if [ -d "$repo/.git" ] ; then
    mr register "$repo"
  fi
done
```

## Update all of your registered repos

```
mr up
```
