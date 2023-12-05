# Setup fzf
# ---------
if [[ ! "$PATH" == */home/ant/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/ant/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/ant/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/ant/.fzf/shell/key-bindings.zsh"
