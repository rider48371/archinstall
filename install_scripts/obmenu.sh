#!/bin/sh

sudo pacman -Sy perl-gtk3
sudo pacman -Sy perl-module-build

## install LinuxDesktopFile
cd ~/Downloads
git clone https://github.com/trizen/Linux-DesktopFiles.git
cd Linux-DesktopFiles
perl Build.PL
     ./Build
     ./Build test
sudo   ./Build install
     
mkdir ~/.local/bin/
mkdir ~/.config/obmenu-generator

cd ~/Downloads
git clone https://github.com/trizen/obmenu-generator.git
cd obmenu-generator
cp obmenu-generator ~/.local/bin/
cp schema.pl ~/.config/obmenu-generator

sudo rm -r ~/Downloads/Linux-DesktopFiles
sudo rm -rf ~/Downloads/obmenu-generator

obmenu-generator -p -i     # dynamic menu with icons




