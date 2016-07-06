# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/ant/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/ant/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/ant/.fzf/man* && -d "/Users/ant/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/ant/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/ant/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/Users/ant/.fzf/shell/key-bindings.zsh"

