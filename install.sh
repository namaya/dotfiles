
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

        # Install brew
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        brew update
        
        # Install zsh
        brew install \
            zsh \
            zsh-autosuggestions

        cp zsh/.zshenv $HOME
        cp -r zsh $xdg_config_home

        # Install alacritty
        brew install alacritty
        cp -r alacritty $xdg_config_home

        # Install tmux
        brew install \
            tmux \
            arl/arl/gitmux \
            joshmedeski/sesh/sesh

        git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
        mkdir -p $xdg_config_home/tmux
        cp tmux/tmux.conf $xdg_config_home/tmux/tmux.conf

        # Install essential CLI tools
        brew install \
            exa \
            zoxide \
            fd \
            ripgrep \
            fzf \
            jesseduffield/lazygit/lazygit \
            node

        # Install neovim
        brew install \
            neovim

        mkdir -p $HOME/.config/nvim
        cp -r nvim/* $HOME/.config/nvim

        ;;
esac

