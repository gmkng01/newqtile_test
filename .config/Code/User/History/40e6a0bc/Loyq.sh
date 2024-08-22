#!/bin/bash

echo "Updating mirrors"
cd ~/newqtile_test/mirror
# Update mirror list
./mirror.sh
cd

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
    # "nemo"
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
    "sxiv"
    "mpv"
    "grub-customizer"
    "gnome-disk-utility"
    "telegram-desktop"
    "kdeconnect"
    "volctl"
	"pcmanfm"
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
    "`betterlockscreen`"
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
    "nomacs"
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

# Copy .Xmodmap to the home directory
echo "Copying .Xmodmap to the home directory..."
cp -T .bashrc ~/.Xmodmap

# Adding Xmodmap file to xinitrc so it can run automaticly
echo "Adding Xmodmap file to xinitr"
TEXT_FILE="/etc/X11/xinit/xinitrc"
LINE_TO_ADD="xmodmap ~/.Xmodmap"
sudo echo "$LINE_TO_ADD" >> "$TEXT_FILE"
echo "Line added to $TEXT_FILE"

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
sudo cp -rT grub /boot/grub/

# Configration for Abhishek Mishra only
git config --global user.name "Abhishek Mishra"
git config --global user.email gmkng1@gmail.com

mkdir -p  ~/Pictures/Screenshots
# mkdir -p  ~/Pictures/

echo "Installation complete!"

