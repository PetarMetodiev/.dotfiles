#!/bin/sh

# tools-popup.sh toggles a popup view into a shared tmux "tools" session (named
# "{tools}" so it sorts last in the session chooser).
# provides a popup view into the full tools window. It ensures the tools
# session/window exist on first use, then attaches the full window inside a
# tmux display-popup. Tools are created lazily when invoked (C-d), not
# precreated on session start.

TOOLS_SESSION="$(tmux show-option -gqv @tools_session 2>/dev/null)"
[ -n "$TOOLS_SESSION" ] || TOOLS_SESSION="{tools}"
SCRIPT_PATH="${HOME}/.dotfiles/tmux/scripts/tools-popup.sh"

ensure_tools_session() {
  if ! tmux has-session -t "$TOOLS_SESSION" 2>/dev/null; then
    tmux new-session -d -s "$TOOLS_SESSION"
    tmux set-option -t "$TOOLS_SESSION" status off
  fi
}

ensure_tools_window() {
  session="$1"
  [ -n "$session" ] || return 0
  [ "$session" = "$TOOLS_SESSION" ] && return 0

  tools_win="${session}-tools"
  if ! tmux list-windows -t "$TOOLS_SESSION" -F '#W' | grep -qx "$tools_win"; then
    tmux new-window -t "$TOOLS_SESSION" -n "$tools_win"
    tmux split-window -t "$TOOLS_SESSION:$tools_win" -h
    tmux split-window -t "$TOOLS_SESSION:$tools_win" -v
  fi
}

attach_tools_window() {
  window="$1" # session:window

  tmux select-window -t "$window"
  tmux attach-session -t "$TOOLS_SESSION"
}

if [ "$1" = "attach-window" ]; then
  if [ -n "$2" ]; then
    attach_tools_window "$2"
    exit 0
  fi

  SESSION="$(tmux display-message -p '#{session_name}')"
  TOOLS_WIN="${SESSION}-tools"

  # If called from inside the tools session, close the popup by detaching.
  if [ "$SESSION" = "$TOOLS_SESSION" ]; then
    tmux detach-client
    exit 0
  fi

  ensure_tools_session
  ensure_tools_window "$SESSION"
  tmux display-popup -E -xC -yC -w 90% -h 85% "env -u TMUX $SCRIPT_PATH attach-window $TOOLS_SESSION:$TOOLS_WIN"
  exit 0
fi

SESSION="$(tmux display-message -p '#{session_name}')"
TOOLS_WIN="${SESSION}-tools"

# If called from inside the tools session, close the popup by detaching.
if [ "$SESSION" = "$TOOLS_SESSION" ]; then
  tmux detach-client
  exit 0
fi

ensure_tools_session
ensure_tools_window "$SESSION"
tmux display-popup -E -xC -yC -w 90% -h 85% "env -u TMUX $SCRIPT_PATH attach-window $TOOLS_SESSION:$TOOLS_WIN"
