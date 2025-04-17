#!/bin/bash

bash 01_system_basics.sh
bash 02_dev_tools.sh
bash 03_terminal_setup.sh
bash 04_env_managers.sh
bash 05_gpg_ssh_setup.sh

# -----------------------------------------
# Create symlinks for dotfiles
# -----------------------------------------

echo "==> Symlinking dotfiles..."

ln -sf "$PWD/dotfiles/.gitconfig" "$HOME/.gitconfig"
ln -sf "$PWD/dotfiles/.editorconfig" "$HOME/.editorconfig"
