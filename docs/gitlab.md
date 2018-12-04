Title: Gitlab

"A single application for the complete DevOps lifecycle" - <https://about.gitlab.com>

# Examples

## Skip CI via commit message

<https://docs.gitlab.com/ce/ci/yaml/#skipping-jobs>

```
#!/usr/bin/env bash
# Skip CI if all changed files are inside dir "foo/"

set -x
regex='^foo\/'

files=( $(git diff --cached --name-only --diff-filter=ACM ) )
for X in "${files[@]}" ; do
  # If any file is not inside dir foo exit 0
  if [[ ! "$X" =~ $regex ]] ; then
    exit 0
  fi
done

# If we've made it here, all changed files are inside dir foo/
# so we append '[no ci]' to commit message to skip CI in Gitlab
echo "[no ci]" >> "$1"
```

# Pros and cons

## Pros
- You can create a new repo by locally initializing a git repo, setting a remote_url to where you want your project to be, and pushing your code. The server gives you a notification that the project has been created and gives you a URL to it.

## Cons
- Push-button GKE is configured at the project level, not the group level, so setting up k8s runners is more involved than it could be.
- User permissions do not have a distinct group entity, they are managed by creating a project sub-group which functions as both a place to put code and a permission level. This shows up in a variety of places, and I suspect is the reason we cannot export groups over SAML.
- There is no command line tool equivalent to the `hub` command that github has, which makes it easier to script pull requests etc..
- Terraform provider for Gitlab is pretty limited compared to Github.

# Links

- <https://docs.gitlab.com/ce/administration/>
