#!/bin/zsh

# In order to avoid making this file executable, run it with like so:
# zsh test session-name

SESSION=$1

# TODO:
# - Search for session name in a predefined list of session names
if [ "$1" != "" ]; then
    echo "Starting session $SESSION"

    tmux new-session -d -s $SESSION

    tmux switch-client -t $SESSION

    # $SESSION:1 means window 1 from the session
    # $SESSION:1.1 means pane 1 in window 1 from $SESSION
    tmux rename-window -t $SESSION:1 'code' 

    # -h - horizontal split(which is actually vertical)
    # -p - set the size of the currently active pane(in this case the right one)
    #      this works properly only if we are attached to the session
    #      https://superuser.com/questions/354844/cannot-resize-tmux-pane-from-bash-script
    tmux split-window -t $SESSION:1 -h -p 20

    tmux new-window -t $SESSION -n 'git'
    tmux split-window -t $SESSION:2 -h

    tmux select-window -t $SESSION:1
    tmux select-pane -t $SESSION:1.1

    # set directory
    tmux send-keys -t $SESSION:1.1 'cd ~/work' C-m
    tmux send-keys -t $SESSION:1.2 'cd ~/work' C-m
    tmux send-keys -t $SESSION:2.1 'cd ~/work' C-m
    tmux send-keys -t $SESSION:2.2 'cd ~/work' C-m

else
    echo "No session name provided"
fi
