# if autojump exists on an ubuntu box
[[ -s /usr/share/autojump/autojump.zsh ]] && \
  source /usr/share/autojump/autojump.zsh

# if autojump exists on a mac
[[ -s /usr/local/bin/brew ]] && \
  . `brew --prefix`/etc/autojump.sh

# if autojump exists on an M1 mac
[[ -s /opt/homebrew/share/autojump/autojump.zsh ]] && \
  source /opt/homebrew/share/autojump/autojump.zsh

