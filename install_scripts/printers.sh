#!/bin/bash

echo "Would you like to install printing services? (y/n)"
read response

if [[ "$response" =~ ^[Yy]$ ]]; then
    echo "Installing printing services..."
		sudo pacman install -y cups cups-pdf system-config-printer simple-scan
		sudo systemctl enable --now cups.service
    echo "Printing services installed."
elif [[ "$response" =~ ^[Nn]$ ]]; then
    echo "Printing services will not be installed."
else
    echo "Invalid input. Please enter 'y' or 'n'."
fi
