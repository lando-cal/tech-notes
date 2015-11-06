baddass version control

# Links
- [http://gitref.org/](http://gitref.org/)
- [http://repo.or.cz/w/git.git/blob/HEAD:/contrib/completion/git-completion.bash](http://repo.or.cz/w/git.git/blob/HEAD:/contrib/completion/git-completion.bash)
- [http://git-scm.com/book/en/Getting-Started-Git-Basics](http://git-scm.com/book/en/Getting-Started-Git-Basics)
- [http://git-scm.com/book/en/Git-on-the-Server-Setting-Up-the-Server](http://git-scm.com/book/en/Git-on-the-Server-Setting-Up-the-Server)
- [http://scottchacon.com/2011/08/31/github-flow.html](http://scottchacon.com/2011/08/31/github-flow.html)
- [https://guides.github.com/introduction/flow/index.html](https://guides.github.com/introduction/flow/index.html)
- [http://nvie.com/posts/a-successful-git-branching-model/](http://nvie.com/posts/a-successful-git-branching-model/)
- [https://training.github.com/kit/intermediate/](https://training.github.com/kit/intermediate/) - Training

# Examples
## git init
### Create a git repository for the CWD

```
git init
echo "" >> .gitignore
echo "# Ignore other unneeded files.
*.swp
*~
.DS_Store" >> .gitignore
```

## git clone
### Clone a local repo

```
git clone /path/to/repo
```

### Clone a remote git repo via ssh

```
git clone user@ssh_server:/opt/git/project
```

## git filesystem operations
### Add everything in the CWD to the git repo

```
git add .
```

### Rename a file in the git repo
This also renames the filesystem file.

```
git mv README.rdoc README.md
```

### Delete a file from the repo

```
git rm filename
```

## git status
### Check the status of git

```
git status
```

## git commit
### Commit the current changes

```
git commit -m "Initial commit"
```

### Commit all changes with commit -a

```
git commit -a -m "Improve the README file"
```

## git config
Git config checks --local, --global, --system.
- Local = per-repo settings.  IE: stored in .git/config directory for the repo
- Global = per-user settings.  IE: stored in ~/.gitconfig
- System = per-system settings, found in /etc/ or wherever git is looking for system settings.

### Git client setup
This creates and modifies ~/.gitconfig with some parameters:

```
git config --global user.name "Daniel Hoherd"
git config --global user.email daniel.hoherd@gmail.com
git config --global alias.co checkout
git config --global core.editor "vim"
git config --global merge.tool vimdiff
git config --global log.date iso
```

### Edit a .git/config file with some params

```
git config --replace-all svn-remote.svn.url https://s.zoosk.com/ops/
git config --replace-all svn-remote.svn.fetch ops:refs/remotes/trunk
git config --add svn-remote.svn.preserve-empty-dirs true
git config --unset svn-remote.svn.branches
git config --unset svn-remote.svn.tags
git config --add svn.authorsfile /srv-cluster/git-svn/git/author.txt
```

### Export your .gitconfig in a git config friendly format

```
git config --list
```

## git diff
### diff between staged and committed

```
git diff --staged
```

### diff that shows per-word colored differences

```
git diff --color-words
```

### Machine readable word diff

```
git diff --word-diff
```

### Diff and ignore whitespace
This does not ignore line ending changes or blank line insertion and removals.

```
git diff -w
```

### Show diffs between master and a given date

```
git diff $(git rev-list -n1 --before="1 month ago" master)
```

## git log
Shows commit history.

### View the commit history

```
git log
```

### Show one log entry

```
git log -1
```

### Show raw log history for 5 most recent commits
Useful for seeing TZ settings.

```
git log --format=raw -5
```

### Really pretty logs

```
log --graph --oneline --decorate --all
```

## git branches
### Create a branch

```
git checkout -b readme-fix
```

### Check which branch you're in

```
git branch
```

### Rename (move) a branch

```
git branch -m oldname newname
```

## git merge
This lets you merge two branches.

### Merge branch with master

```
git checkout master
git merge readme-fix-branch
git branch -d readme-fix-branch
```

### disable fast-forward merges
You can control how the history is kept when merging.  By default, fast-forward merges occur, which replays the commits on the branch that is being merged into.  By disabling this you can see several commits being merged from one branch into another, making it easier to roll back that whole series of commits without digging through the history to see where each commit from the branch came from.

```
git config --global merge.ff false
```

## remotes
### Add a remote

```
git remote add g https://g.zoosk.com/danielh/cfengine
```

### Push to a specific remote

```
git push g master # push to the remote g's master branch
```

### Alter the source of origin
If you move your repo to another location, use this command to change the upstream URL:

```
git remote set-url origin https://danielh@g.zoosk.com/Ops/ops-bin # or whatever the new checkout URL is.
```

## git reset

```
git reflog # show all HEAD changes
git reset HEAD~10 # go back 10 changes, soft keeps the files changes
git reset --hard HEAD~1 # will put us back where we were at the reflog command
```

Alternately, you can use:

```
git reflog --date=iso # absolute date based reflog references
git reset "HEAD@{2015-03-25 14:45:30 -0700}" --hard
```

### Hard reset of local changes
This will abandon all local changes and resolve merge conflicts

```
git fetch origin
git reset --hard origin/master
```

## git clean
### Remove all untracked files and directories
This is useful after your reset to a prior state.  It deletes all files and directories that show up in the untracked section of `git status`

```
git clean -f -d
```

## Misc tricks
### Refresh all Git repos in a path

```
find /var/www/html/mediawiki/ -name .git | while read -r X ; do pushd "$(dirname "${X}")" && [ $(git remote -v | wc -l) -gt 0 ] && git pull && popd ; done ;
```

### Branch cleanup

```
git gc --prune=now
git remote prune origin
```
