https://www.youtube.com/watch?v=lXIb-1_H-mA&t=10s

DNF_CMD=$(which dnf)
APT_CMD=$(which apt)




## Write to sudoers file
echo "neil ALL = (root) NOPASSWD : ALL" > /etc/sudoers.d/neil

## Update the system
if [[ ! -z $DNF_CMD ]]; then
  sudo dnf update -y
elif [[ ! -z $APT_CMD ]]; then
  sudo apt update && sudo apt dist-upgrade -y
else
  echo "Error: Must have apt or dnf installed."
  exit 1;
fi


## Install some programs
sudo apt install -y gnome-tweaks gnome-shell-extension-manager spacefm

## Download resources
Go to https://www.pling.com/p/1805660

## Download and install WhiteSur GTK Theme
./install.sh -t red

## Download and install the Reversal icon theme
./install.sh -red

## Install Fonts
cp -r fonts ~/.local/share/

## Download and install the Vimix cursors theme
./install.sh
mkdir ~/.icons
cp -r ~/.local/share/icons/Vimix-* ~/.icons/

## Install gnome extensions
sudo apt install -y gir1.2-gmenu-3.0
cp -r /data/profile/Downloads/extensions/* ~/.local/share/gnome-shell/extensions/

## log out and back in

## Install media controls
cp -r /data/profile/Downloads/extensions/media-controls-main ~/.local/share/gnome-shell/extensions/mediacontrols@cliffniff.github.com
gnome-extensions enable mediacontrols@cliffniff.github.com

## Import the config
dconf load /org/gnome/shell/extensions/< /data/profile/Downloads/all-extensions-config/all_extension_settings.conf

## Apply the GTK theme, icons, cursors and fonts


## Apply settings
gsettings set org.gnome.desktop.wm.preferences button-layout ":minimize,maximize,close"
timedatectl set-timezone Europe/London
gsettings set org.gnome.desktop.interface clock-format 24h

## Install and configure conky
sudo apt install -y conky-all curl jq moc
mkdir ~/.config/conky
cp -r /data/profile/Downloads/conky-config/conky_config/Graffias ~/.config/conky
cp /data/profile/Downloads/conky-config/conky_config/start_conky.desktop ~/.config/autostart

## Change Wallpaper
cp /data/profile/Downloads/wallpapers-pack/wallpapers_pack ~/.local/share/backgrounds


