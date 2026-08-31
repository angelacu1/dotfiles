#!/bin/bash

tmux_dst_path="$HOME/.tmux.conf"
tmux_src_path="$HOME/dotfiles/.tmux.conf"
ln -s "$tmux_src_path" "$tmux_dst_path"

gitconf_dst_path="$HOME/.gitconfig"
gitconf_src_path="$HOME/dotfiles/.gitconfig"
ln -s "$gitconf_src_path" "$gitconf_dst_path"

grep -qxF 'source ~/dotfiles/bash_setup.sh' ~/.bashrc || echo -e '\n\nsource ~/dotfiles/bash_setup.sh' >> ~/.bashrc