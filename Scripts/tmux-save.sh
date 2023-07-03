#!/bin/bash

SESSION_NAME="scrimo"
SESSION_DIR="/mnt/sda2/home/bl4ck/Documents/Code/projects/scrimo"

tmux new-session -s $SESSION_NAME -c $SESSION_DIR -d
tmux new-window -t $SESSION_NAME:1
tmux new-window -t $SESSION_NAME:2
tmux new-window -t $SESSION_NAME:3
tmux send-keys -t $SESSION_NAME:0 "cd frontend && pnpm dev" Enter
tmux send-keys -t $SESSION_NAME:1 "cd backend && pnpm watch" Enter
tmux send-keys -t $SESSION_NAME:2 "cd backend && pnpm dev" Enter
tmux send-keys -t $SESSION_NAME:3 "nvim" Enter
tmux select-window -t $SESSION_NAME:3
tmux attach -t $SESSION_NAME
