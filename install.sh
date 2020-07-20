
echo "Installing dotfiles!"

sudo apt-get update

# Install oh-my-zsh
sudo apt-get install -y curl
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
