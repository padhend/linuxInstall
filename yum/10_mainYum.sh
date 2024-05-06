#!/bin/bash

#####################
## Get the OS type ##
#####################

if [ -f /etc/os-release ]; then
  source /etc/os-release
else
  echo "os-release file doesnt exist"
  exit 1
fi
OS=${ID}
VERSION=${VERSION_ID}
echo $OS $VERSION

#######################
## Update the system ##
#######################
if [[ $OS == "almalinux" ]]; then
  sudo yum update -y
else
  sudo apt update && apt upgrade -y
fi

#######################
## Install epel repo ##
#######################
if [[ $OS -eq "almalinux" ]]; then
  sudo yum install -y epel-release
fi

#######################
## Generate ssh Keys ##
#######################
if [ -d ~/.ssh/ ]; then
  chmod 700 .ssh/
  chmod 644 .ssh/id_rsa.pub
  chmod 600 .ssh/id_rsa
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_rsa
  ## enter your passphrase
else
  ssh-keygen -t rsa -b 4096 -C "$USER@$(hostname)"
fi

########################
## install some stuff ##
########################
if [[ $OS -eq "almalinux" ]]; then
  sudo dnf install -y \
  dconf-editor \
  git \
  gnome-extensions-app \
  gnome-shell-extension-appindicator \
  gnome-tweaks \
  gparted \
  htop \
  meld \
  neofetch \
  ntfs-3g \
  ntfsprogs \
  openssh-server \
  remmina \
  vlc 
fi

#######################
## Remove some stuff ##
#######################
if [[ $OS -eq "almalinux" ]]; then
  sudo dnf remove -y \
  gnome-tour
fi
##############################
## Disable IPv6 and SELinux ##
##############################
sudo sed -i --follow-symlinks 's/^SELINUX=.*/SELINUX=disabled/g' /etc/sysconfig/selinux && cat /etc/sysconfig/selinux
sudo grubby --update-kernel ALL --args ipv6.disable=1 selinux=0
if [ -d /boot/efi ]; then
  sudo grub2-mkconfig -o /boot/efi/EFI/almalinux/grub.cfg
else
  sudo grub2-mkconfig -o /boot/grub2/grub.cfg
fi

#########################
## Enable Better Fonts ##
#########################
echo "Enabling Better Fonts"
sudo -s dnf -y copy enable dawid/better_fonts
sudo -s dnf install -y fontconfig-font-replacements
sudo -s dnf install -y fontconfig-enhanced-defaults


##########################
## Install Joplin Notes ##
##########################
wget -O - https://raw.githubusercontent.com/laurent22/joplin/dev/Joplin_install_and_update.sh | bash
## Restore notes from backup

##########################
## install flatpak repo ##
##########################
flatpak remote-add --if-not-exists --user flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo dnf install -y flatpak

######################
## install flatpaks ##
######################
flatpak install --user flathub io.github.mimbrero.WhatsAppDesktop -y
flatpak install --user flathub org.jdownloader.JDownloader -y

#######################
## install flameshot ##
#######################
mkdir --parents ~/Applications/Flameshot
cd ~/Applications/Flameshot
rm Flameshot-*x86_64.AppImage
curl --remote-name --remote-header-name --location $(curl -s https://api.github.com/repos/flameshot-org/flameshot/releases/latest \
  | grep -Po 'https://github.com/flameshot-org/flameshot/releases/download/[^}]*\.AppImage' \
  | uniq)
chmod +x Flameshot-*.x86_64.AppImage

cat << EOF > $HOME/Applications/Flameshot/Flameshot.desktop
[Desktop Entry]
Name=Flameshot
GenericName=Flameshot
Exec=$HOME/Applications/Flameshot/Flameshot-12.1.0.x86_64.AppImage
Terminal=false
# Icon=$HOME/
Type=Application
Categories=Accessories
Version=12.1.0
EOF

sudo cp $HOME/Applications/Flameshot/Flameshot.desktop /usr/share/applications/Flameshot.desktop

####################
## Install VSCode ##
####################
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
sudo dnf install -y code

###############################
## Install Multimedia Codecs ##
###############################
echo "Installing media codecs"
sudo dnf install -y gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel -y
sudo dnf install -y lame\* --exclude=lame-devel -y
sudo dnf group upgrade --with-optional Multimedia -y

############################
## Install the dark theme ##
############################
echo "Installing Dracula theme"
sudo git clone https://github.com/dracula/gtk.git /usr/share/themes/Dracula
gsettings set org.gnome.desktop.interface gtk-theme 'Dracula' 
gsettings set org.gnome.desktop.wm.preferences theme 'Dracula'
notify-send "Installed Dracula theme"

##################
## Install MEGA ##
##################
wget https://mega.nz/linux/repo/Fedora_38/x86_64/megasync-Fedora_38.x86_64.rpm && sudo dnf install "$PWD/megasync-Fedora_38.x86_64.rpm"

#######################
## Install 1password ##
#######################
sudo dnf install -y https://downloads.1password.com/linux/rpm/stable/x86_64/1password-latest.rpm

#####################################
## install Private Internet Access ##
#####################################
FILENAME=pia-linux-3.5.7-08120.run
wget https://installers.privateinternetaccess.com/download/$FILENAME -P ~/Downloads/
chmod +x ~/Downloads/$FILENAME
~/Downloads/$FILENAME


###################
## Things to add ##
###################

