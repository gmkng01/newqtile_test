#!/bin/bash

# List of programs to install
programs=(
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
	# "networkmanager"				Do it while installation of ARCH
	# "network-manager-applet"		Do it while installation of ARCH
	"font-manager"
	"blueman"
	"bluez"
	"bluez-utils"
	"dunst"
	"nitrogen"
	"lxsession"
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
)

# Install each AUR program via yay
echo "Installing AUR programs via yay..."
for aur_program in "${aur_programs[@]}"; do
    yay -S --noconfirm $aur_program
done

# Additional commands for fonts setup
echo "Setting up fonts..."
cd /usr/local/share/
sudo cp -rT fonts /usr/local/share/
cd /usr/local/share/fonts/
sudo fc-cache -vf

# Change to the newqtil directory
cd newqtil

# Copy .config directory to the home directory
echo "Copying .config directory to the home directory..."
sudo cp -rT .config ~/

# Copy .bashrc to the home directory
echo "Copying .bashrc to the home directory..."
cp -T .bashrc ~/

echo "Installation complete!"
