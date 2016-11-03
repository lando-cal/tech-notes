baddass version control

# Links

- <http://gitref.org/>
- <http://repo.or.cz/w/git.git/blob/HEAD:/contrib/completion/git-completion.bash>
- <http://git-scm.com/book/en/Getting-Started-Git-Basics>
- <http://git-scm.com/book/en/Git-on-the-Server-Setting-Up-the-Server>
- <http://scottchacon.com/2011/08/31/github-flow.html>
- <https://guides.github.com/introduction/flow/index.html>
- <http://nvie.com/posts/a-successful-git-branching-model/>
- <https://training.github.com/kit/intermediate/> - Training

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

`git config` interacts with configs. There are three scopes: --local, --global, --system.

- Local = per-repo settings. IE: stored in .git/config directory for the repo
- Global = per-user settings. IE: stored in ~/.gitconfig
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
git config --replace-all svn-remote.svn.url https://svn.example.com/ops/
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

Show differences between objects and stuff.

### diff between staged and committed

This is useful when you're adding files that were not previously in the repo alongside changes to existing files, since a bare `git diff` before adding the files will only show changes to files that were already in the repo.

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

### Show what has changed since a point in time

```
git whatchanged --since="18 hours ago" -p
```

or...

```
git whatchanged --since="18 hours ago" --until="6 hours ago" -p
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

### Show log entries that contain a given string

```
git log -S search_string
```

### Show logs for a given dir in the last 3 days

```
git log --since=3.days modules/profile_sensu
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

## git show

### Show the changes from a specific sha

```
git show f73f9ec7c07e
```

### Show a complete file as of a given sha

This is an absolute path from the git root, not relative to CWD.

```
git show f73f9ec7c07e:dir/filename.yaml
```

## git branches

Branches are an integral part of git. They allow you to work on distinct changes without mixing them all up together.

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

You can control how the history is kept when merging. By default, fast-forward merges occur, which replays the commits on the branch that is being merged into. By disabling this you can see several commits being merged from one branch into another, making it easier to roll back that whole series of commits without digging through the history to see where each commit from the branch came from.

```
git config --global merge.ff false
```

## remotes

### Add a remote

```
git remote add upstream https://github.com/danielhoherd/homepass
```

### Push to a specific remote

```
# push to the master branch of the remote named upstream
git push upstream master
```

### Alter the source of origin

If you move your repo to another location, use this command to change the upstream URL:

```
git remote set-url origin https://user@newhost/newpath/reponame
```

## git reset

`git reset` allows you to reset your state to what it was at a previous point.

### Reset to a prior state based on what has been done locally

The reflog is a log of what steps have been performed locally. You can view the reflog, then reset to a prior state.

```
git reflog # show all HEAD changes
git reset --hard 45e0ae5 # reset all git tracked state to 45e0ae5
```

Alternately, you can use a date:

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

This is useful after your reset to a prior state. It deletes all files and directories that show up in the untracked section of `git status`

```
git clean -ffdx
```

## Misc tricks

### Refresh all Git repos in a path

```
find /var/www/html/mediawiki/ -name .git | while read -r X ; do
  pushd "$(dirname "${X}")" && \
  [ $(git remote -v | wc -l) -gt 0 ] && \
  git pull && \
  popd ;
done ;
```

### Show a numbered list of remote branches sorted by last commit date

```
git branch -r | grep -v HEAD | xargs -r -n1 git log -1 \
--pretty=format:'%ad %h%d %an | %s %n' --date=iso -1 | sort | nl -ba
```

### Branch cleanup

```
git gc --prune=now
git remote prune origin
```
