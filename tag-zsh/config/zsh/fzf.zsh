# Setup fzf
# ---------
if [[ ! "$PATH" == */home/joel/.fzf/bin* ]]; then
  export PATH="$PATH:/home/joel/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */home/joel/.fzf/man* && -d "/home/joel/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/home/joel/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/joel/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/joel/.fzf/shell/key-bindings.zsh"
