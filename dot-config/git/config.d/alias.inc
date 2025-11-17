[include]
    path = alias.inc.d/gitalias.inc
[alias]
    l = log --all --decorate --graph --oneline
    last = log -1 HEAD
    lr = log --all --decorate --oneline --reverse
    unstage = reset HEAD --
    whatchanged = log --raw --no-merges
