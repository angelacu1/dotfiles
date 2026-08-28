#!/bin/bash

tmux_dst_path="$HOME/.tmux.conf"
tmux_src_path="$HOME/dotfiles/.tmux.conf"
ln -s "$tmux_src_path" "$tmux_dst_path"
