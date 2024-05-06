#!/bin/bash

## Install flatpak repo
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo

## Warehouse
sudo flatpak install flathub io.github.flattool.Warehouse -y

## Bitwarden
sudo flatpak install flathub com.bitwarden.desktop -y

## Extension manager
sudo flatpak install flathub com.mattjakeman.ExtensionManager -y

## Whatsapp
sudo flatpak install flathub io.github.mimbrero.WhatsAppDesktop -y

## Telegram
sudo flatpak install flathub org.telegram.desktop -y

## extensions
sudo flatpak install flathub org.gnome.Extensions -y

## VSCode
sudo flatpak install flathub com.visualstudio.code -y

## Flameshot
flatpak install flathub org.flameshot.Flameshot -y

## Yubico Authenticator
sudo flatpak install flathub com.yubico.yubioath -y

## Betterbird
sudo flatpak install flathub eu.betterbird.Betterbird -y

## vlc
sudo flatpak install flathub org.videolan.VLC -y

## Transmission
sudo flatpak install flathub io.github.TransmissionRemoteGtk -y

## Joplin
sudo flatpak install flathub net.cozic.joplin_desktop -y

## JDownloader2
sudo flatpak install flathub org.jdownloader.JDownloader -y

## Mega
sudo flatpak install flathub nz.mega.MEGAsync -y

## Steam
sudo flatpak install flathub com.valvesoftware.Steam -y

## Remmina
sudo flatpak install flathub org.remmina.Remmina -y

