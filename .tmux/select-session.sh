#!/usr/bin/bash
# select-session.sh - Interactive tmux session selector with FZF
#
# USAGE:
#   ./select-session.sh
#
# DESCRIPTION:
#   This script provides an interactive session selector for tmux using FZF.
#   It searches for projects in ~/git and existing session files in ~/.tmux/sessions,
#   then allows you to select one to either create a new session or attach to existing.
#
# FEATURES:
#   - Lists all directories in ~/git as potential sessions
#   - Integrates with existing session configuration files
#   - Supports prefix-based session templates (e.g., "web-*" matches "web-frontend")
#   - Creates default 3-window layout (nvim, shell, lazygit) for new sessions
#   - Handles both inside-tmux and outside-tmux execution
#
# DIRECTORY STRUCTURE:
#   ~/git/                     # Projects directory (scanned for session names)
#   ~/.tmux/sessions/          # Session configuration files
#
# SESSION FILE EXAMPLES:
#   ~/.tmux/sessions/myproject        # Exact match session config
#   ~/.tmux/sessions/web-*            # Prefix template (matches web-frontend, web-api, etc.)
#
# TMUX HOTKEY SETUP:
#   Add this line to your ~/.tmux.conf to bind to Ctrl-f:
#
#   bind-key C-f display-popup -E -w 80 -h 24 "bash ~/.tmux/select-session.sh"
#
#   Alternative bindings:
#   bind-key f display-popup -E -w 80 -h 24 "bash ~/.tmux/select-session.sh"    # Just 'f'
#   bind-key s display-popup -E -w 80 -h 24 "bash ~/.tmux/select-session.sh"    # Replace default session tree
#
# EXAMPLE SESSION CONFIGURATION FILE:
#   Create ~/.tmux/sessions/myproject with content like:
#
#   new-session -d -s myproject -n editor -c ~/git/myproject
#   send-keys -t myproject:editor 'nvim src/main.rs' Enter
#   new-window -t myproject:2 -n server -c ~/git/myproject
#   send-keys -t myproject:server 'cargo run' Enter
#   new-window -t myproject:3 -n git -c ~/git/myproject
#   send-keys -t myproject:git 'lazygit' Enter
#
# EXAMPLE PREFIX-BASED TEMPLATE:
#   Create ~/.tmux/sessions/web-* with content like:
#
#   new-session -d -s "${TMUX_SESSION_NAME}" -n code -c ~/git/${TMUX_SESSION_NAME}
#   send-keys -t ${TMUX_SESSION_NAME}:code 'nvim' Enter
#   new-window -t ${TMUX_SESSION_NAME}:2 -n dev -c ~/git/${TMUX_SESSION_NAME}
#   send-keys -t ${TMUX_SESSION_NAME}:dev 'npm run dev' Enter
#
# DEPENDENCIES:
#   - fzf (for interactive selection)
#   - tmux (obviously)
#   - envsubst (for template variable substitution)

# Attempt to connect to an existing tmux session
attach_session() {
    local session_name=$1
    if [ -n "$TMUX" ]; then
        tmux switch-client -t "$session_name:1"
    else
        tmux attach-session -t "$session_name:1"
    fi

    # Cleanup weird files being created
    tmux run-shell -t "$session_name:1" "rm -f 'command list-panes: too many arguments (need at most 0)'"
}

projects_dir="$HOME/git"
sessions_dir="$HOME/.tmux/sessions"

projects=$(find "$projects_dir"/* -type d -prune | cut -d'/' -f 5)
sessions=$(ls "$sessions_dir")
# OPTIONAL
# If you want to include any sessions that are not directories.
# options=$(echo "$projects" ; echo "$sessions")
options=$(echo "$projects")
real_session_name=$(echo "$options" | sort -u | fzf)
# replace common special characters with underscores
session_name="${real_session_name/[ .]/_}"

if [ -z "$session_name" ]; then
    exit 0
fi

if tmux has-session -t "=$session_name" 2>/dev/null; then
    attach_session "$session_name"
    exit
fi

if [ -f "$sessions_dir/$real_session_name" ]; then
    tmux source-file "$sessions_dir/$real_session_name"
else
    # Check for prefix-based session scripts
    prefix_script=""
    for script in "$sessions_dir"/*; do
        if [ -f "$script" ]; then
            script_name=$(basename "$script")
            if [[ "$script_name" == *-\* ]] && [[ "$real_session_name" == "${script_name%-*}"-* ]]; then
                prefix_script="$script"
                break
            fi
        fi
    done

    if [ -n "$prefix_script" ]; then
        # Use the selection as the session name instead of hardcoding in the session script
        export TMUX_SESSION_NAME="$session_name"
        envsubst < "$prefix_script" | tmux source-file -
    else
        # Default session
        workspace_dir="$projects_dir/$real_session_name"

        tmux new-session -d -s "$session_name" -n nvim -c "$workspace_dir"
        tmux send-keys -t "$session_name":1 'nvim' Enter

        tmux new-window -t "$session_name":2 -n shell -c "$workspace_dir"

        tmux new-window -t "$session_name":3 -n git -c "$workspace_dir"
        tmux send-keys -t "$session_name":3 'lazygit' Enter
    fi
fi

attach_session "$session_name"
