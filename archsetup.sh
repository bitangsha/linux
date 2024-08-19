#!/bin/bash
sudo pacman -Sy;
sudo pacman -S --needed --noconfirm reflector;
sudo cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak;
sudo reflector --verbose --latest 20 --protocol https --sort rate --save /etc/pacman.d/mirrorlist;
sudo pacman -Sy;
sudo pacman -S --needed --noconfirm git timeshift nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader packagekit-qt6 flatpak fwupd ffmpegthumbs unrar kaccounts-integration kaccounts-providers kio-gdrive kimageformats amd-ucode icoutils libreoffice-fresh gwenview spectacle wine-staging wine-gecko wine-mono lutris steam fuse fuse2 opencl-nvidia audacity base-devel git qt5-imageformats kimageformats gimp yt-dlp exfat-utils linux-headers linux-zen-headers linux-lts-headers vi partitionmanager mangohud gamemode qbittorrent android-udev chromium system-config-printer cups okular syncthing kdeconnect kcalc hplip korganizer;
sudo systemctl enable --now cronie.service;
sudo systemctl enable --now cups.service;
sudo systemctl enable --now bluetooth;
git clone https://aur.archlinux.org/yay.git;
cd yay;
makepkg -si;
yay -S --noconfirm pamac-aur;
yay -S --noconfirm cloudflare-warp-bin;
sudo systemctl enable --now warp-svc;
warp-cli register;
yay -S --noconfirm libxcrypt-compat;
flatpak install -y flathub net.davidotek.pupgui2;
flatpak install -y flathub com.github.wwmm.easyeffects;
flatpak install -y com.heroicgameslauncher.hgl;
echo "ALL DONE, reboot"
