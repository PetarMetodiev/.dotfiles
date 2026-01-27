#!/bin/sh

SESSION="$(tmux display-message -p '#{session_name}')"
TOOLS_SESSION="tools"
TOOLS_WIN="${SESSION}-tools"

# If called from inside the tools session, close the popup by detaching.
if [ "$SESSION" = "$TOOLS_SESSION" ] && [ "$1" != "attach" ]; then
  tmux detach-client
  exit 0
fi
SCRIPT_PATH="${HOME}/.dotfiles/tmux/scripts/tools-popup.sh"

attach_tools_pane() {
  target="$1"           # session:window.pane
  window="${target%.*}" # session:window

  # Ensure the correct pane is zoomed, then attach.
  tmux if-shell -F -t "$target" "#{==:#{window_zoomed_flag},1}" "resize-pane -Z -t $target" ""
  tmux select-pane -t "$target"
  tmux resize-pane -Z -t "$target"
  tmux attach-session -f ignore-size -t "$target"
  tmux if-shell -F -t "$window" "#{==:#{window_zoomed_flag},1}" "resize-pane -Z -t $window" ""
}

if [ "$1" = "attach" ]; then
  attach_tools_pane "$2"
  exit 0
fi

# Ensure the tools session exists.
if ! tmux has-session -t "$TOOLS_SESSION" 2>/dev/null; then
  tmux new-session -d -s "$TOOLS_SESSION"
fi

# Ensure this session's tools window exists inside the tools session.
if ! tmux list-windows -t "$TOOLS_SESSION" -F '#W' | grep -qx "$TOOLS_WIN"; then
  tmux new-window -t "$TOOLS_SESSION" -n "$TOOLS_WIN"
  tmux split-window -t "$TOOLS_SESSION:$TOOLS_WIN" -h
  tmux split-window -t "$TOOLS_SESSION:$TOOLS_WIN" -v
fi

CMD1="$(tmux display-message -p -t "$TOOLS_SESSION:$TOOLS_WIN.1" '#{pane_current_command}')"
CMD2="$(tmux display-message -p -t "$TOOLS_SESSION:$TOOLS_WIN.2" '#{pane_current_command}')"
CMD3="$(tmux display-message -p -t "$TOOLS_SESSION:$TOOLS_WIN.3" '#{pane_current_command}')"

[ -n "$CMD1" ] || CMD1="pane-1"
[ -n "$CMD2" ] || CMD2="pane-2"
[ -n "$CMD3" ] || CMD3="pane-3"

tmux display-menu -T "Tools" \
  "$CMD1" "1" "display-popup -E -xC -yC -w 90% -h 85% 'env -u TMUX $SCRIPT_PATH attach $TOOLS_SESSION:$TOOLS_WIN.1'" \
  "$CMD2" "2" "display-popup -E -xC -yC -w 90% -h 85% 'env -u TMUX $SCRIPT_PATH attach $TOOLS_SESSION:$TOOLS_WIN.2'" \
  "$CMD3" "3" "display-popup -E -xC -yC -w 90% -h 85% 'env -u TMUX $SCRIPT_PATH attach $TOOLS_SESSION:$TOOLS_WIN.3'"
