mkdir Apps Documents Repos installerdir forgejo .local/share/applications 
cd Apps
mkdir zen 
cd $HOME 
sudo pacman -Syu
sudo pacman -S waybar otf-font-awesome keepass fuse2 unzip hyprpaper neofetch xdg-desktop-portal-kde ttf-hack-nerd stow lazygit git alacritty zsh
sudo pacman -R kitty 

# Download and install nvm:
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

# Install snapd
cd installerdir
git clone https://aur.archlinux.org/snapd.git 
cd snapd
makepkg -si
sudo systemctl enable --now snapd.socket
cd ..
git clone https://aur.archlinux.org/legcord-bin.git
cd legcord-bin
makepkg -si
cd $HOME

# Download Zed Editor
curl -f https://zed.dev/install.sh | sh
# Download Zen Browser
curl -L "https://github.com/zen-browser/desktop/releases/download/1.12.5b/zen-x86_64.AppImage" -o "$HOME/Apps/zen/zen.AppImage"
# Download Vivaldi
sudo snap install vivaldi
# switch to zsh
chsh -s $(which zsh)

# Clone dotfile repo
git clone https://github.com/gdlambda/dotfiles.git

# Delete old dotfiles
cd .config
rm -rf hypr alacritty waybar kitty nvim 
cd $HOME
rm .zshrc
cd dotfiles/dotconfig
stow . --target $HOME/.config
cd ../homefiles
stow . --target $HOME
cd ../wallpapers 
stow . --target $HOME/.config
cd ../applications 
stow . --target $HOME/.local/share/applications

echo "Setup Complete!"
