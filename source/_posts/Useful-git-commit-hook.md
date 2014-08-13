title: Useful git-commit hook
date: 2014-08-13 14:23:15
tags:
---
Here is a useful git usage tip.

Sometimes we all make changes in code that we don't want to commit. For example:

``` java
  // if (user.isAuthorised()) {
  if (true) {
```

You may do this to test some things locally, but If you forget and push something like this to remote, bad things may happen.
There is a simple solution to this problem involving pre-commit hook. Specify some string tag to mark the changes you never-never want to commit, I use **do-not-commit**.
Now, when you do some bad changes add this tag in commentary, like this:

``` java
// do-not-commit
// if (user.isAuthorised()) {
if (true) {
...
```

Now you need a pre-commit hook, that checks for **do-not-commit** string in staged changes. Example script below:

``` bash
# Check for 'do-not-commit' tag
grep 'do-not-commit' $(git diff --cached --name-only) > /dev/null
if [ $? == 0 ]
then
  echo '
WARNING!
Some staged changes contain "do-not-commit" tag which marks changes that should not be commited:
'
  grep 'do-not-commit' $(git diff --cached --name-only)
  echo '
(Use "git commit --no-verify" if you are feeling lucky...)
'
  exit 1
fi
```

To apply this script, add it to the end of .git/hooks/pre-commit (or create new file if it does not exist).
