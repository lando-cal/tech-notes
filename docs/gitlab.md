# Gitlab

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
