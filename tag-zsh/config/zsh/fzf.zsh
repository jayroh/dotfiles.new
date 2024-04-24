# Setup fzf
# ---------

machine=`uname -s`

if [ "$machine" == "Linux" ]; then
  FZF_BASE="/usr/share/doc/fzf/examples"
else
  FZF_BASE="/opt/homebrew/opt/fzf/shell"
fi


# Auto-completion and key bindings
# ---------------
source "$FZF_BASE/completion.zsh"
source "$FZF_BASE/key-bindings.zsh"
