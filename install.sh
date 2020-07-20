
echo "Installing dotfiles!"

sudo apt-get update

# Install oh-my-zsh
sudo apt-get install -y wget
sudo sed s/required/sufficient/g -i /etc/pam.d/chsh
sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"