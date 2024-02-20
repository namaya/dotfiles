
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
        ;;
esac

cp -r nvim/* .config/nvim

