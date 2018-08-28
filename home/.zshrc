# inspiration
alias inspire='head -$((${RANDOM} % `wc -l < ~/.inspiration` + 1)) ~/.inspiration | tail -1'
inspire

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
DEFAULT_USER="ant"
ZSH_THEME="agnoster"

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


plugins=(cp jump git gitfast)
source $ZSH/oh-my-zsh.sh

HISTSIZE=10000
SAVEHIST=10000

# User configuration

ANDROID_HOME="$HOME/Library/Android/sdk"
JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_161.jdk/Contents/Home"
export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$HOME/gopath/bin:/usr/local/bin:/usr/local/sbin:/usr/local/bin:/bin:/usr/sbin:/sbin:/usr/bin:/opt/X11/bin:$HOME/bin:$HOME/bin:$HOME/.local/bin:$HOME/platform-tools"

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
  INSTALLED="$CHECKER $data >/dev/null 2>&1"

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
alias ggt="git tag -f"
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
function use() {
    eval $(egrep -v '^\s*#' .env.$1 | xargs) ${@:2}
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

export NVM_DIR="$HOME/.nvm"

if [[ ! -d "$NVM_DIR" ]] 
then
    wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.25.1/install.sh | bash
fi

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Android


# heroku
source ~/.heroku-account.sh

alias hk=heroku
function hke() {
    if [[ -z "$1" ]]
    then
        APP=`basename $(pwd)`
    else
        APP=$1
    fi
    heroku config -s -a $APP | egrep "DATABASE|AWS|DJANGO"
}
function hks() {
    if [[ -z "$1" ]]
    then
        APP=`basename $(pwd)`
    else
        APP=$1
    fi
    echo "* Serving app with $APP config"
    hke | tr '\n' ' ' | xargs -J % env % dj serve
}
alias hkl="heroku logs -a "
function hkup() {
    if [[ -z "$1" ]]
    then
        APP=`basename $(pwd)`
    else
        APP=$1
    fi
    git push https://git.heroku.com/$APP.git master:master   
}
function hkupx() {
    if [[ -z "$1" ]]
    then
        APP=`basename $(pwd)`
    else
        APP=$1
    fi
    heroku repo:purge_cache -a $APP && hkup $APP
}

# pyenv

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
command -v pyenv > /dev/null 2>&1 && eval "$(pyenv init -)"
command -v pyenv-virtualenv-init > /dev/null 2>&1 && eval "$(pyenv virtualenv-init -)"

TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M KB'$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

# docker
eval "$(docker-machine env default 2>/dev/null)"

# kubernetes
alias kz="kubez"
alias kc="kubectl"

# tmux
alias ted="vim ~/.tmux.conf"

tmux new -s default 2>/dev/null
if [ "$TMUX" = "" ]; then tmux -2 attach -t default; fi

alias beam="gotty tmux -2 attach &; ngrok http 8080"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
LS_COLORS='no=00;38;5;250:rs=0:di=01;38;5;198:ln=01;38;5;37:mh=00:pi=48;5;230;38;5;136;01:so=48;5;230;38;5;136;01:do=48;5;230;38;5;136;01:bd=48;5;230;38;5;244;01:cd=48;5;230;38;5;244;01:or=48;5;235;38;5;160:su=48;5;160;38;5;230:sg=48;5;136;38;5;230:ca=30;41:tw=48;5;64;38;5;230:ow=48;5;235;38;5;33:st=48;5;33;38;5;230:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:ex=01;38;5;82:*.cmd=00;38;5;82:*.exe=00;38;5;82:*.com=00;38;5;82:*.btm=00;38;5;82:*.bat=00;38;5;82:*.jpg=00;38;5;37:*.jpeg=00;38;5;37:*.png=00;38;5;37:*.gif=00;38;5;37:*.bmp=00;38;5;37:*.xbm=00;38;5;37:*.xpm=00;38;5;37:*.tif=00;38;5;37:*.tiff=00;38;5;37:*.pdf=00;38;5;98:*.odf=00;38;5;98:*.doc=00;38;5;98:*.ppt=00;38;5;98:*.pptx=00;38;5;98:*.db=00;38;5;98:*.aac=00;38;5;208:*.au=00;38;5;208:*.flac=00;38;5;208:*.mid=00;38;5;208:*.midi=00;38;5;208:*.mka=00;38;5;208:*.mp3=00;38;5;208:*.mpc=00;38;5;208:*.ogg=00;38;5;208:*.ra=00;38;5;208:*.wav=00;38;5;208:*.m4a=00;38;5;208:*.axa=00;38;5;208:*.oga=00;38;5;208:*.spx=00;38;5;208:*.xspf=00;38;5;208:*.mov=01;38;5;208:*.mpg=01;38;5;208:*.mpeg=01;38;5;208:*.3gp=01;38;5;208:*.m2v=01;38;5;208:*.mkv=01;38;5;208:*.ogm=01;38;5;208:*.mp4=01;38;5;208:*.m4v=01;38;5;208:*.mp4v=01;38;5;208:*.vob=01;38;5;208:*.qt=01;38;5;208:*.nuv=01;38;5;208:*.wmv=01;38;5;208:*.asf=01;38;5;208:*.rm=01;38;5;208:*.rmvb=01;38;5;208:*.flc=01;38;5;208:*.avi=01;38;5;208:*.fli=01;38;5;208:*.flv=01;38;5;208:*.gl=01;38;5;208:*.m2ts=01;38;5;208:*.divx=01;38;5;208:*.log=00;38;5;240:*.bak=00;38;5;240:*.aux=00;38;5;240:*.bbl=00;38;5;240:*.blg=00;38;5;240:*~=00;38;5;240:*#=00;38;5;240:*.part=00;38;5;240:*.incomplete=00;38;5;240:*.swp=00;38;5;240:*.tmp=00;38;5;240:*.temp=00;38;5;240:*.o=00;38;5;240:*.pyc=00;38;5;240:*.class=00;38;5;240:*.cache=00;38;5;240:';

export LS_COLORS

# if [ -f ~/.dir_colors ]; then
#    eval `dircolors ~/.dir_colors`
# fi
cd $HOME
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
