export TERM=xterm-256color

# start, or attach to, tmux session based on PWD basename
t() {
  PROJ_NAME=$(basename $PWD | sed 's/\.//')

  tmux has-session -t safety2 2>/dev/null

  if [ "$?" -eq 1 ] ; then
    echo "Project not found. Creating and configuring."
    tmux new-session -d -s $PROJ_NAME

    # Probably editing in here, so ...
    tmux rename-window "vim"

    # Probably going to need a "server" window, so ...
    tmux neww -n server

    # Go back to vim window ...
    tmux select-window -t :1
  else
    echo "Project found. Connecting."
  fi

  tmux attach-session -t $PROJ_NAME
}