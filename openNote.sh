#!/usr/bin/env bash

#Bash script: tmux markdown editor + live preview
#Usage: ./md_tmux.sh <file.md>

FILE="$1"

if [[ -z "$FILE" ]]; then
    echo "Usage: $0 <markdown_file>"
    exit 1
fi

#Expand to full path
FILE="$(realpath "$FILE")"

SESSION="mdpreview"

#Start a new tmux session with two panes
tmux new-session -d -s "$SESSION"

#Left pane: open the markdown file in your editor (vim)
#When the editor exits, kill the tmux session
tmux send-keys -t "$SESSION:0.0" "vim '$FILE'; tmux kill-session -t '$SESSION'" C-m

#Split right pane
tmux split-window -h -t "$SESSION:0"

#Right pane: watch file changes and render with glow
tmux send-keys -t "$SESSION:0.1" "ls '$FILE' | entr -r sh -c 'clear; glow \"$FILE\"'" C-m

#Make sure the left pane is active so the cursor is ready
tmux select-pane -t "$SESSION:0.0"

#Attach session
tmux attach -t "$SESSION"

