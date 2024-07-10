#!/bin/bash

# Main list of packages
packages=(
	"bspwm"
    "sxhkd"
    "polybar"
    "alacritty"
)

# Function to read common packages from a file
read_common_packages() {
    local common_file="$1"
    if [ -f "$common_file" ]; then
        packages+=( $(< "$common_file") )
    else
        echo "Common packages file not found: $common_file"
        exit 1
    fi
}

# Read common packages from file
read_common_packages $HOME/archinstall/install_scripts/common_packages.txt

# Function to install packages if they are not already installed
install_packages() {
    local pkgs=("$@")
    local missing_pkgs=()

    # Check if each package is installed
    for pkg in "${pkgs[@]}"; do
        if ! dpkg -l | grep -q " $pkg "; then
            missing_pkgs+=("$pkg")
        fi
    done

    # Install missing packages
    if [ ${#missing_pkgs[@]} -gt 0 ]; then
        echo "Installing missing packages: ${missing_pkgs[@]}"
        sudo pacman -Sy "${missing_pkgs[@]}"
        if [ $? -ne 0 ]; then
            echo "Failed to install some packages. Exiting."
            exit 1
        fi
    else
        echo "All required packages are already installed."
    fi
}

# Call function to install packages
install_packages "${packages[@]}"

sudo systemctl enable acpid

xdg-user-dirs-update
mkdir ~/Screenshots/


SCRIPT_DIR=~/archinstall
REPO_URL=https://github.com/rider48371/wmdots.git

# Check if the directory already exists
if [ -d "$SCRIPT_DIR/wmdots" ]; then
    echo "Directory $SCRIPT_DIR/wmdots already exists."
else
    # Clone the repository
    echo "Cloning wmdots repository..."
    git clone $REPO_URL $SCRIPT_DIR/wmdots
    if [ $? -eq 0 ]; then
        echo "Repository cloned successfully."
    else
        echo "Error: Failed to clone repository."
        exit 1
    fi
fi

# moving custom config
\cp -r ~/archinstall/wmdots/scripts/ ~
\cp -r ~/archinstall/wmdots/.config/bspwm/ ~/.config/
\cp -r ~/archinstall/wmdots/.config/polybar/ ~/.config/
\cp -r ~/archinstall/wmdots/.config/dunst/ ~/.config/
\cp -r ~/archinstall/wmdots/.config/rofi/ ~/.config/
\cp -r ~/archinstall/wmdots/.config/picom/ ~/.config/
\cp -r ~/archinstall/wmdots/.config/backgrounds/ ~/.config/

chmod +x ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/polybar-bspwm

# adding gtk theme and icon theme
bash ~/archinstall/colorschemes/blue.sh

