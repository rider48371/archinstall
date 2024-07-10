#!/bin/bash

echo "Would you like to install Bluetooth services? (y/n)"
read response

if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "Installing Bluetooth services..."
		sudo pacman -Sy bluez blueman
		sudo systemctl enable --now bluetooth
# sudo systemctl enable bluetooth
    echo "Bluetooth services installed."
elif [[ "$response" =~ ^[Nn]$ ]]; then
    echo "Bluetooth services will not be installed."
else
    echo "Invalid input. Please enter 'y' or 'n'."
fi

