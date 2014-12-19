# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.

ZSH_THEME="gallois"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(cp git jump)

source $ZSH/oh-my-zsh.sh

HISTSIZE=10000
SAVEHIST=10000

# User configuration

export PATH="$HOME/gopath/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/opt/X11/bin:$HOME/bin:$HOME/bin"

# setup dependencies

function deps() {
if [[ `uname -s` == "Darwin" ]]
then
  BREW_INSTALLED=`which brew`
  if [[ "$BREW_INSTALLED" == *"not found"* ]]
  then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  fi
  INSTALLER=`which brew`
  INSTALLER="$INSTALLER"
  CHECKER="$INSTALLER info"
  CHECK='Not installed'
else
  INSTALLER='sudo apt-get'
  CHECKER='dpkg -s'
  CHECK='not installed'
fi

for data in `cat $HOME/.dependencies`
do
  INSTALLED="$CHECKER $data 2>&1"

  if [[ `eval $INSTALLED` == *"$CHECK"* ]]
  then
    eval "$INSTALLER install $data"
  else
    echo "$data is already installed."
  fi
done
}

if [[ `which fasd` == *"not found"* ]] 
then
  deps
fi

# fasd
eval "$(fasd --init posix-alias zsh-hook)"

# homesick

export DOT="$HOME/.homesick/repos/dotfiles"
alias hs="homesick"
alias hss="hs status"
alias hsc="hs commit"
alias hsp="hs push"
alias hspl="hs pull"
alias hsdown="hspl"
alias hsa="(cd $DOT; git add -A;)" 
alias hsup="hsa && hsc && hsp"
alias hsd="hs diff"
alias hsl="hs link"

# git

## working (gg*)
alias ggs="git status"
alias ggd="git diff --color"
alias ggc="git commit"
alias gga="git add"
alias ggcav="ggc -av"
alias ggaa="git add -A"
alias ggca="ggaa && ggcav"   # commit all
alias ggrm="git remove"
alias ggm="git merge"
alias ggrs="git reset --hard"
## pulling (ggpl*, ggf, ggdown)
alias ggf="git fetch"
alias ggpl="git pull"
alias ggplc='ggpl origin $(current_branch)'
alias ggdown="ggf && ggplc"      # fetch all and pull
## pushing (ggpu*, ggup, ggca)
alias ggpu="git push"
alias ggpuc='ggpu origin $(current_branch)' # push 
alias ggup="ggca && ggpuc"       # commit all and push 
## branching (ggb*)
alias ggco="git checkout"
alias ggb="git branch"            
alias ggbn="ggco -b"             # new branch          
alias ggbd="ggb -D"             # delete branch
alias ggba="ggb -a"             # list all branches
function ggbrm () {              # remove branch
ggbd $1 && ggpuc :$1 # remote locally and from master
}
## logging (ggl*)
alias ggl="git log"
## remotes (ggr*)
alias ggr="git remote"
alias ggrv="ggr -v"              # list remote details
alias ggra="ggr add"             # add remote
alias ggrrm="ggr remove"         # remove remote

# vim
EDITOR='vim'
alias v='f -e vim' # quick opening files with vim
alias ved="vim ~/.vimrc"
alias emacs="v"
alias nano="v"
alias pico="v"
alias mate="v"

# zsh
alias zup="source ~/.zshrc"
alias zed="vim ~/.zshrc"

## fuzzy shell plugin
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# go
s ~/gopath/bin/activate
export GOROOT=$(go env GOROOT)

# inspiration
alias inspire='head -$((${RANDOM} % `wc -l < ~/.inspiration` + 1)) ~/.inspiration | tail -1'

inspire


