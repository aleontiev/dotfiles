dotfiles
========
Managed with homesick:


`gem install homesick`

`homesick clone git@github.com:aleontiev/dotfiles.git`

`homesick link`

Custom configuration:

```

# homesick/dotfiles
DOT="~/.homesick/repos/dotfiles"
alias hs="homesick"
alias hss="hs status"
alias hsc="hs commit"
alias hspush="hs push"
alias hspull="hs pull"
alias hsa="(cd $DOT; git add -A;)" 
alias hsup="hsa && hsc && hspush"
alias hsed="hs exec dotfiles"
alias hsd="hs diff"
alias hsl="hs link"```

# zsh
alias zup="source ~/.zshrc"
alias zedit="vim ~/.zshrc"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source ~/.startup.zsh

# homesick pull && homesick link 
hspull && hsl
echo "dotfiles reloaded"

```
