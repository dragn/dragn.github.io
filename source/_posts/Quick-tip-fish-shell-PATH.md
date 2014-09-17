title: "Quick tip: fish-shell PATH"
date: 2014-09-17 14:51:43
tags:
- fish-shell
---
Add path temporarily:

     $ set -gx PATH $PATH <path>
Add path permanently:

    $ touch ~/.config/fish/config.fish
    $ echo "set -gx PATH \$PATH <path>" >> ~/.config/fish/config.fish
Adding something to PATH variable is a common task, it helps you to use short command names  in the shell instead of full paths to executables.

The first code snippet uses fish's builtin command *set* to add the *&lt;path&gt;* (replace it with a path to the executable) to the end of PATH array. Flags -g and -x mean, 'global' and 'export' (you can read about it in "man set"). This setting will be lost after you quit the current shell session, but it is good for testing.

The second snippet ensures that you have the fish's config file, and adds the first command to the end of it. After that, the variable will be set every time you start the shell.
