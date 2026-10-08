#!/bin/bash

vscode-sock() { export VSCODE_IPC_HOOK_CLI=$(ls -t /run/user/1000/vscode-ipc-*.sock 2>/dev/null | head -1); }

alias refresh-agent='eval "$(tmux show-environment -s SSH_AUTH_SOCK)" && ssh-add -l'

# Keep a stable agent symlink that tmux shells can always use
fix-agent() {
    local stable="$HOME/.ssh/agent.sock" s
    # Prefer the current socket if it's live; else newest live VS Code socket.
    if [ "$SSH_AUTH_SOCK" != "$stable" ] && [ -S "$SSH_AUTH_SOCK" ]; then
        ln -sf "$SSH_AUTH_SOCK" "$stable"
    elif [ ! -S "$stable" ]; then
        for s in $(ls -t /run/user/$(id -u)/vscode-ssh-auth-sock-* 2>/dev/null); do
            if [ -S "$s" ]; then ln -sf "$s" "$stable"; break; fi
        done
    fi
    export SSH_AUTH_SOCK="$stable"
}
fix-agent
