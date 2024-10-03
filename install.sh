
#!/bin/sh
set -euo pipefail

echo "Installing dotfiles!"

readonly platform=$(uname -s)
readonly xdg_config_home="$HOME/.config"

case $platform in
    Linux*)
        echo "Running on Linux."

        sudo apt-get update
        sudo apt-get install neovim tmux ripgrep
	;;
    Darwin*)
        echo "Running on macos."

        # Install package manager
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Install packages
        brew update
        
        brew install \
            alacritty \
            zsh-autosuggestions \
            exa \
            zoxide \
            fd \
            ripgrep \
            neovim \
            jesseduffield/lazygit/lazygit \
            node

        # Install zsh
        brew install zsh
        cp zsh/.zshenv $HOME
        cp -r zsh $xdg_config_home

        # Install alacritty
        brew install alacritty
        cp -r alacritty $xdg_config_home

        # Install tmux
        brew install tmux
        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        mkdir -p $xdg_config_home/tmux
        cp tmux/tmux.conf $xdg_config_home/tmux/tmux.conf
        ;;
esac

mkdir -p $HOME/.config/nvim
cp -r nvim/* $HOME/.config/nvim

