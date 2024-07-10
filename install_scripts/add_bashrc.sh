#!/bin/bash

echo "Would you like to overwrite your current .bashrc with the rider48374 .bashrc? (y/n)"
read response

if [[ "$response" =~ ^[Yy]$ ]]; then
    \cp ~/wmdots/.bashrc ~/.bashrc
    echo "rider48371 .bashrc has been copied to ~/.bashrc"
elif [[ "$response" =~ ^[Nn]$ ]]; then
    echo "No changes have been made to ~/.bashrc"
else
    echo "Invalid input. Please enter 'y' or 'n'."
fi
