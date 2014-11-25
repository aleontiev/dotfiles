dotfiles
========
Managed with homesick:


`gem install homesick`

`homesick clone git@github.com:aleontiev/dotfiles.git`

`homesick link`

Custom Configuration
====================
```

# homesick/dotfiles
DOT="$HOME/.homesick/repos/dotfiles"
alias hs="homesick"
alias hss="hs status"
alias hsc="hs commit"
alias hsp="hs push"
alias hspl="hs pull"
alias hsa="(cd $DOT; git add -A;)" 
alias hsup="hsa && hsc && hsp"
alias hsd="hs diff"
alias hsl="hs link"

# git
alias ggs="git status"
alias ggd="git diff --color"
alias ggc="git commit"
alias gga="git add"
alias ggrm="git remove"
alias ggm="git merge"
alias ggp="git push origin $(current_branch)"
alias ggf="git fetch"
alias ggl="git log"
alias ggco="git checkout"     
alias ggpl="git pull origin $(current_branch)"
alias ggca="gga -A && ggc -av" # commit all
alias ggup="ggca && ggp"       # commit all and push
alias ggb="ggco -b"            
alias ggr="git remote"
alias ggrv="ggr -v"
alias ggra="ggr add"
alias ggrrm="ggr remove"

# zsh
alias zup="source ~/.zshrc"
alias zed="vim ~/.zshrc"

# fuzzy shell
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# startup script (load/install system dependencies)
source ~/.startup.zsh

```
