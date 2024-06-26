#!/bin/bash

# Update mirror list
# ./mirror.sh

# List of programs to install
programs=(
    "qtile"
    "neovim"
    "git"
    "htop"
    "curl"
    "wget"
    "firefox"
    "lxsession"
    "terminator"
    "rofi"
    "picom"
    "font-manager"
    "blueman"
    "bluez"
    "bluez-utils"
    "nitrogen"
    "pulseaudio"
    "pavucontrol"
    "brightnessctl"
    "pamixer"
    "alsa-plugins"
    "alsa-utils"
    "pulseaudio-bluetooth"
    "xarchiver"
    "zip"
    "unzip"
    "unrar"
    "p7zip"
    "nemo"
    "python-dbus-next"
    "mtpfs"
    "gvfs-mtp"
    "gvfs-gphoto2"
    "telegram-desktop"
    "trayer"
    "lxappearance"
    "lightdm-slick-greeter"
    "xfce4-screenshooter"
    "upower"
    "emacs"
)

# Update the package database and upgrade the system
echo "Updating the package database and upgrading the system..."
sudo pacman -Syu --noconfirm

# Install each program in the list
echo "Installing programs..."
for program in "${programs[@]}"; do
    if pacman -Qi $program &> /dev/null; then
        echo "$program is already installed."
    else
        sudo pacman -S --noconfirm $program
    fi
done

# Create a Sources directory and clone yay
echo "Setting up yay AUR helper..."
mkdir -p ~/Sources
cd ~/Sources
if [ ! -d "yay" ]; then
    git clone https://aur.archlinux.org/yay.git
else
    echo "yay directory already exists. Skipping clone."
fi

# Build and install yay
cd yay
makepkg -si --noconfirm

# List of AUR programs to install via yay
aur_programs=(
    "visual-studio-code-bin"
    "betterlockscreen"
    "dracula-gtk-theme-full"
    "dracula-icons-git"
    "envycontrol"
    "pfetch"
    "python-pulsectl"
    "jmtpfs"
    "lightdm-settings"
    "python-colorthief"
    "volctl"
    "qtile-extras"
)

# Install each AUR program via yay
echo "Installing AUR programs via yay..."
for aur_program in "${aur_programs[@]}"; do
    yay -S --noconfirm $aur_program
done

# Change to the newqtile_test directory
cd ~/newqtile_test

# Additional commands for fonts setup
echo "Setting up fonts..."
sudo cp -rT fonts /usr/local/share/fonts/
sudo fc-cache -vf

# Copy .config directory to the home directory
echo "Copying .config directory to the home directory..."
cp -rT .config ~/.config/

# Copy .bashrc to the home directory
echo "Copying .bashrc to the home directory..."
cp -T .bashrc ~/.bashrc

# Copy 50-libinput.conf to /etc/X11/xorg.conf.d/
echo "Copying 50-libinput.conf and 10-serverflags.conf to /etc/X11/xorg.conf.d/..."
sudo cp 50-libinput.conf /etc/X11/xorg.conf.d/
sudo cp 10-serverflags.conf /etc/X11/xorg.conf.d/

# Enable Bluetooth service
echo "Enabling Bluetooth service..."
sudo systemctl enable bluetooth
sudo systemctl start bluetooth

# Copy lightdm config
echo "Copying lightdm configration to /etc/"
sudo cp -rT lightdm /etc/lightdm

# Copy Grub theme config
echo "Copying Grub themes configration to /boot/"
sudo cp -rT grub /boot/

echo "Installation complete!"
