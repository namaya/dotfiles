
#!/bin/bash
set -euo pipefail

echo "Installing dotfiles!"

platform=$(uname -s)

case $platform in
    Linux*)
        echo "Running on Linux."

        sudo apt-get update
        sudo apt-get install neovim tmux ripgrep
	;;
    Darwin*)
        echo "Running on macOS."

        # Install package manager

        brew install \
            alacritty \
            neovim \
            exa \
            zsh-autosuggestions
        ;;
esac

mkdir -p $HOME/.config/nvim
cp -r nvim/* $HOME/.config/nvim

