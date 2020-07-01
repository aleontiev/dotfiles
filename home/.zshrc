#
# Inspiration
#
printf "Loading...\r"

#
# tmux
#
printf "...tmux\r"
alias ted="vim ~/.tmux.conf"
tmux new -s default 2>/dev/null
if [ "$TMUX" = "" ]; then tmux -2 attach -t default; fi

#
# zsh
#
printf "...zsh\r"
alias zup="source ~/.zshrc"
alias zed="vim ~/.zshrc"
HISTSIZE=10000
SAVEHIST=10000
TIMEFMT='%J   %U  user %S system %P cpu %*E total'$'\n'\
'avg shared (code):         %X KB'$'\n'\
'avg unshared (data/stack): %D KB'$'\n'\
'total (sum):               %K KB'$'\n'\
'max memory:                %M KB'$'\n'\
'page faults from disk:     %F'$'\n'\
'other page faults:         %R'

#
# poetry
#
printf "...poetry\r"
source $HOME/.poetry/env

#
# fasd
#
printf "...fasd\r"
eval "$(fasd --init posix-alias zsh-hook)"

#
# homesick
#
printf "...homesick\r"
export DOT="$HOME/.homesick/repos/dotfiles"
alias hs="homesick"
alias hsc="hs commit"
alias hsp="hs push"
alias hspl="hs pull"
alias hsdown="hspl"
alias hsa="(cd $DOT; git add -A;)" 
alias hsup="hsa && hsc && hsp"
alias hsd="hs diff"
alias hsl="hs link"

#
# git
#
printf "...git\r"
alias gs="git status"
alias gd="git diff --color"
alias gc="git commit"
alias ga="git add"
alias gca="ga -A && git commit -av"
alias grm="git remove"
alias gm="git merge"
alias gf="git fetch"
alias gpl="git pull"
alias gplc='gpl origin $(git rev-parse --abbrev-ref HEAD)'
alias gdown="gf && gplc"      # fetch all and pull
alias gpu="git push"
alias gpuc='gpu origin $(git rev-parse --abbrev-ref HEAD)' # push 
alias gup="gca && gpuc"       # commit all and push 
alias gco="git checkout"
alias gb="git branch"            
alias gbn="gco -b"             # new branch          
alias gbd="gb -D"             # delete branch
alias gba="gb -a"             # list all branches
alias gl="git log"
alias gr="git remote"
alias grv="gr -v"              # list remote details
alias gra="gr add"             # add remote
alias grrm="gr remove"         # remove remote

#
# vim
#
printf "...vim\r"
EDITOR='vim'
alias v='f -e vim' # quick opening files with vim
alias ved="vim ~/.vimrc"
alias emacs="v"
alias nano="v"
alias pico="v"
alias mate="v"


#
# nvm
#

printf "...nvm\r"
nvm() {
    unset -f nvm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    nvm "$@"
}
 
node() {
    unset -f node
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    node "$@"
}
 
npm() {
    unset -f npm
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
    npm "$@"
}

#
# pyenv
#
printf "...pyenv\r"
export PYENV_ROOT="${PYENV_ROOT:=${HOME}/.pyenv}"
if ! type pyenv > /dev/null && [ -f "${PYENV_ROOT}/bin/pyenv" ]; then
    export PATH="${PYENV_ROOT}/bin:${PATH}"
fi

if type pyenv > /dev/null; then
    export PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"
    function pyenv() {
        unset -f pyenv
        eval "$(command pyenv init -)"
        eval "$(command pyenv virtualenv-init -)"
        pyenv $@
    }
fi


#
# docker
# 
printf "...docker\r"
eval "$(docker-machine env default 2>/dev/null)"

#
# kubernetes
# 
printf "...kubernetes\r"
alias kc="kubectl"

#
# utils
# 
printf "...utils\r"
alias beam="gotty tmux -2 attach &; ngrok http 8080"
function use() {
    eval $(egrep -v '^\s*#' .env.$1 | xargs) ${@:2}
}


#
# iTerm2
#
printf "...iterm2\r"
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

#
# ls
#

printf "...ls\r"
LS_COLORS='no=00;38;5;250:rs=0:di=01;38;5;198:ln=01;38;5;37:mh=00:pi=48;5;230;38;5;136;01:so=48;5;230;38;5;136;01:do=48;5;230;38;5;136;01:bd=48;5;230;38;5;244;01:cd=48;5;230;38;5;244;01:or=48;5;235;38;5;160:su=48;5;160;38;5;230:sg=48;5;136;38;5;230:ca=30;41:tw=48;5;64;38;5;230:ow=48;5;235;38;5;33:st=48;5;33;38;5;230:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:ex=01;38;5;82:*.cmd=00;38;5;82:*.exe=00;38;5;82:*.com=00;38;5;82:*.btm=00;38;5;82:*.bat=00;38;5;82:*.jpg=00;38;5;37:*.jpeg=00;38;5;37:*.png=00;38;5;37:*.gif=00;38;5;37:*.bmp=00;38;5;37:*.xbm=00;38;5;37:*.xpm=00;38;5;37:*.tif=00;38;5;37:*.tiff=00;38;5;37:*.pdf=00;38;5;98:*.odf=00;38;5;98:*.doc=00;38;5;98:*.ppt=00;38;5;98:*.pptx=00;38;5;98:*.db=00;38;5;98:*.aac=00;38;5;208:*.au=00;38;5;208:*.flac=00;38;5;208:*.mid=00;38;5;208:*.midi=00;38;5;208:*.mka=00;38;5;208:*.mp3=00;38;5;208:*.mpc=00;38;5;208:*.ogg=00;38;5;208:*.ra=00;38;5;208:*.wav=00;38;5;208:*.m4a=00;38;5;208:*.axa=00;38;5;208:*.oga=00;38;5;208:*.spx=00;38;5;208:*.xspf=00;38;5;208:*.mov=01;38;5;208:*.mpg=01;38;5;208:*.mpeg=01;38;5;208:*.3gp=01;38;5;208:*.m2v=01;38;5;208:*.mkv=01;38;5;208:*.ogm=01;38;5;208:*.mp4=01;38;5;208:*.m4v=01;38;5;208:*.mp4v=01;38;5;208:*.vob=01;38;5;208:*.qt=01;38;5;208:*.nuv=01;38;5;208:*.wmv=01;38;5;208:*.asf=01;38;5;208:*.rm=01;38;5;208:*.rmvb=01;38;5;208:*.flc=01;38;5;208:*.avi=01;38;5;208:*.fli=01;38;5;208:*.flv=01;38;5;208:*.gl=01;38;5;208:*.m2ts=01;38;5;208:*.divx=01;38;5;208:*.log=00;38;5;240:*.bak=00;38;5;240:*.aux=00;38;5;240:*.bbl=00;38;5;240:*.blg=00;38;5;240:*~=00;38;5;240:*#=00;38;5;240:*.part=00;38;5;240:*.incomplete=00;38;5;240:*.swp=00;38;5;240:*.tmp=00;38;5;240:*.temp=00;38;5;240:*.o=00;38;5;240:*.pyc=00;38;5;240:*.class=00;38;5;240:*.cache=00;38;5;240:';

export LS_COLORS

#
# vault
#
export VAULT_ADDR="https://altvault.altschool.com:8200"

#
# oh-my-zsh
#
printf "...oh-my-zsh\r"
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="agnoster"
DEFAULT_USER="ant"
plugins=(poetry fzf)
ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

alias inspire='head -$((${RANDOM} % `wc -l < ~/.inspiration` + 1)) ~/.inspiration | tail -1'
inspire
fortune -o | cowthink -f eyes --aurora

export PATH="$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$HOME/go/bin:/usr/local/go/bin:$HOME/bin:$HOME/.local/bin:${PATH}"
