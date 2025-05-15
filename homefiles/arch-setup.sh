echo "Create folders..."
mkdir Apps Documents Repos installerdir forgejo .local/share/applications 
cd Apps
mkdir zen 
cd $HOME  
echo "Update pacman packages..."
sudo pacman -Syu
echo "Download important packages..."
sudo pacman -S waybar otf-font-awesome keepass fuse2 unzip hyprpaper neofetch xdg-desktop-portal-kde ttf-hack-nerd stow lazygit git alacritty zsh
echo "Remove unnecessary packages..."
sudo pacman -R kitty 

# Download and install nvm: 
echo "Install node version manager, npm and pnpm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 22

# Verify the Node.js version:
node -v
nvm current 

# Verify npm version:
npm -v

npm install -g pnpm

echo "Installing snapd..."
# Install snapd
cd installerdir
git clone https://aur.archlinux.org/snapd.git 
cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket

echo "Installing legcord..."
cd ..
git clone https://aur.archlinux.org/legcord-bin.git
cd legcord-bin
makepkg -si
cd $HOME

echo "Downloading necessary software..."
# Download Zed Editor
curl -f https://zed.dev/install.sh | sh
# Download Zen Browser
curl -L "https://github.com/zen-browser/desktop/releases/download/1.12.5b/zen-x86_64.AppImage" -o "$HOME/Apps/zen/zen.AppImage"
# Download Vivaldi
sudo snap install vivaldi
# switch to zsh
chsh -s $(which zsh)
# Download forgejo
cd $HOME/installerdir
wget https://codeberg.org/forgejo/forgejo/releases/download/v11.0.1/forgejo-11.0.1-linux-amd64
chmod +x forgejo-11.0.1-linux-amd64
# Verify Forgejo sha
gpg --keyserver keys.openpgp.org --recv EB114F5E6C0DC2BCDD183550A4B61A2DC5923710
wget https://codeberg.org/forgejo/forgejo/releases/download/v11.0.1/forgejo-11.0.1-linux-amd64.asc
gpg --verify forgejo-11.0.1-linux-amd64.asc forgejo-11.0.1-linux-amd64
cd $HOME
# Download nvim
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
mkdir -p /opt/nvim
mv nvim-linux-x86_64.appimage /opt/nvim/nvim

echo "Delete auto generated dotfiles..."
# Delete old dotfiles
cd .config
rm -rf hypr alacritty waybar kitty nvim 
cd $HOME
rm .zshrc

echo "Stow the dotfiles into their respective folder..."
cd dotfiles/dotconfig
stow . --target $HOME/.config
cd ../homefiles
stow . --target $HOME
cd ../wallpapers 
stow . --target $HOME/.config
cd ../applications 
stow . --target $HOME/.local/share/applications

echo "Setup Complete!"
