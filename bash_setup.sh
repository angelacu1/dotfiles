#!/bin/bash

vscode-sock() { export VSCODE_IPC_HOOK_CLI=$(ls -t /run/user/1000/vscode-ipc-*.sock 2>/dev/null | head -1); }