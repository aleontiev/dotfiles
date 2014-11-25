dotfiles
========
Managed with homesick:


`gem install homesick`

`homesick clone git@github.com:aleontiev/dotfiles.git`

`homesick link`

Custom configuration:

```
# homesick/dotfiles
DOT="$HOME/.homesick/repos/dotfiles"
alias hs="homesick"
alias hss="hs status"
alias hsc="hs commit"
alias hspush="hs push"
alias hspull="hs pull"
alias hsa="(cd $DOT; git add -A;)" 
alias hsup="hsa && hsc && hspush"
alias hsed="hs exec dotfiles"
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
alias ggup="ggca && ggp"       # commit and push all

alias ggb="ggco -b"            # new branch

alias ggr="git remote"
alias ggrv="ggr -v"
alias ggra="ggr add"
alias ggrrm="ggr remove"

# zsh
alias zup="source ~/.zshrc"
alias zed="vim ~/.zshrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.startup.zsh

```
