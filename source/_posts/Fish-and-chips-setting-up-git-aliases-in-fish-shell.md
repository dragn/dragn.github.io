title: "Fish and chips: setting up git aliases in fish-shell"
date: 2014-08-13 15:28:18
tags:
- git
- fish-shell
---
[Fish-shell](http://fishshell.com/) is my favorite shell.
Setting init commands for fish differs from the other shells. You need to add command to **~/.config/fish/config.fish**.
<!-- more -->

For example, you can add following useful aliases for git:
``` bash
alias st='git status'
alias di='git diff'
alias log='git log -10 --oneline'
alias push='git push'
alias pull='git pull'
```

Here is a copy-paste snippet to run in the shell:
``` bash
echo "
# git aliases
alias st='git status'
alias di='git diff'
alias log='git log -10 --oneline'
alias push='git push'
alias pull='git pull'" >> ~/.config/fish/config.fish
```
