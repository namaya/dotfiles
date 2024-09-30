
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
        echo "Running on macos."

        # Install package manager
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        # Install packages
        brew update && brew install \
            alacritty \
            neovim \
            tmux \
            zsh-autosuggestions \
            jesseduffield/lazygit/lazygit \
            exa \
            zoxide \
            fd \
            ripgrep \
            node
        ;;
esac

mkdir -p $HOME/.config/nvim
cp -r nvim/* $HOME/.config/nvim

