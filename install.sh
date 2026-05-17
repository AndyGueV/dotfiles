#!/bin/bash

echo "🚀 Installing AndyGueV Hyprland Setup..."

# =========================================
# PACKAGES
# =========================================

sudo pacman -S --needed -noconfirm \
hyprland \
kitty \
waybar \
rofi \
dunst \
swaync \
hyprlock \
hypridle \
fastfetch \
cava \
yazi \
dolphin \
grim \
slurp \
swappy \
wl-clipboard \
cliphist \
brightnessctl \
pamixer \
pavucontrol \
network-manager-applet \
blueman \
neovim \
zsh \
git \
wget \
curl \
unzip \
ttf-jetbrains-mono-nerd \
noto-fonts \
noto-fonts-emoji

# =========================================
# CREATE CONFIG FOLDERS
# =========================================

mkdir -p ~/.config

# =========================================
# COPY CONFIGS
# =========================================

cp -r hypr ~/.config/
cp -r kitty ~/.config/
cp -r waybar ~/.config/
cp -r rofi ~/.config/
cp -r swaync ~/.config/
cp -r fastfetch ~/.config/
cp -r cava ~/.config/
cp -r yazi ~/.config/
cp -r nvim ~/.config/

# =========================================
# WALLPAPERS
# =========================================

mkdir -p ~/Pictures/Wallpapers
cp wallpapers/* ~/Pictures/Wallpapers/

# =========================================
# SCREENSHOTS FOLDER
# =========================================

mkdir -p ~/Pictures/Screenshots

# =========================================
# ENABLE SERVICES
# =========================================

systemctl --user enable --now pipewire
systemctl --user enable --now wireplumber

# =========================================
# DEFAULT SHELL
# =========================================

chsh -s /bin/zsh

echo "✅ Installation complete!"
echo "Reboot recommended 😎"
