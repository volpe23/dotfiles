#!/usr/bin/env bash
set -e

echo "[*] Updating system..."
sudo pacman -Syu --noconfirm

echo "[*] Installing base packages..."
sudo pacman -S --needed - < pkglist.txt

echo "[*] Installing yay..."
if ! command -v yay &>/dev/null; then
    sudo pacman -S --needed --noconfirm git base-devel
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay && makepkg -si --noconfirm
    cd -
fi

echo "[*] Installing AUR packages..."
yay -S --needed - < aurlist.txt

echo "[*] Installing stow..."
sudo pacman -S --needed stow

echo "[*] Applying dotfiles..."
stow */

echo "[*] Done! Your system is ready."

