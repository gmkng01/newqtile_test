#!/bin/bash

# Update mirror list
sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.old
echo "Server = https://mirror.osbeck.com/archlinux/\$repo/os/\$arch
Server = http://irltoolkit.mm.fcix.net/archlinux/\$repo/os/\$arch
Server = https://opencolo.mm.fcix.net/archlinux/\$repo/os/\$arch
Server = https://mirror.yuki.net.uk/archlinux/\$repo/os/\$arch
Server = https://irltoolkit.mm.fcix.net/archlinux/\$repo/os/\$arch
Server = https://mirror.nag.albony.in/archlinux/\$repo/os/\$arch
Server = https://mirror.sahil.world/archlinux/\$repo/os/\$arch" | sudo tee /etc/pacman.d/mirrorlist


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
	"mtpfs"
	"gvfs-mtp"
	"gvfs-gphoto2"
	"telegram-desktop"
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
        sudo pacman -Sy --noconfirm $program
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
)

# Install each AUR program via yay
echo "Installing AUR programs via yay..."
for aur_program in "${aur_programs[@]}"; do
    yay -S --noconfirm $aur_program
done



# Additional commands for fonts setup
echo "Setting up fonts..."
# cd /usr/local/share/
sudo cp -rT fonts /usr/local/share/
cd /usr/local/share/fonts/
sudo fc-cache -vf

# Change to the newqtil directory
cd
cd newqtil

# Copy .config directory to the home directory
echo "Copying .config directory to the home directory..."
sudo cp -rT .config ~/

# Copy .bashrc to the home directory
echo "Copying .bashrc to the home directory..."
cp -T .bashrc ~/

# Copy 50-libinput.conf to /etc/X11/xorg.conf.d/
echo "Copying 50-libinput.conf to /etc/X11/xorg.conf.d/..."
sudo cp 50-libinput.conf /etc/X11/xorg.conf.d/

# Enable Bluetooth service
echo "Enabling Bluetooth service..."
sudo systemctl enable bluetooth

echo "Installation complete!"
