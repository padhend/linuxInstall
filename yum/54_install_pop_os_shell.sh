#!/bin/bash

sudo dnf install -y gnome-shell-extension-pop-shell
# Pop shell keyboard shortcuts
sudo dnf install -y make cargo rust gtk3-devel
git clone https://github.com/pop-os/shell-shortcuts /home/$USER/fedora/pop-theme/shell-shortcuts
cd /home/$USER/fedora/pop-theme/shell-shortcuts
make
sudo make install
pop-shell-shortcuts
sudo dnf install -y sassc meson glib2-devel
git clone https://github.com/pop-os/gtk-theme /home/$USER/fedora/pop-theme/gtk-theme
cd /home/$USER/fedora/pop-theme/gtk-theme
meson build && cd build
ninja
sudo ninja install

gsettings set org.gnome.desktop.interface gtk-theme "Pop"
git clone https://github.com/pop-os/icon-theme /home/$USER/fedora/pop-theme/icon-theme
cd /home/$USER/fedora/pop-theme/icon-theme
meson build
sudo ninja -C "build" install

gsettings set org.gnome.desktop.interface icon-theme "Pop"
gsettings set org.gnome.desktop.interface cursor-theme "Pop"
sudo dnf install -y fira-code-fonts 'mozilla-fira*' 'google-roboto*'

