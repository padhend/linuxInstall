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
export OS=${ID}
VERSION=${VERSION_ID}
echo $OS $VERSION

#######################
## Set up the shares ##
#######################
read -p "Password: " PASSWORD

FILE="$HOME/.smbcredentials"
if [ -f $FILE ]; then
  echo "smbcreds already exist"
else
cat << EOF > $FILE
username=$USER
password=$PASSWORD
EOF
chmod 600 $FILE
fi

chmod 600 ~/.smbcredentials
sudo mkdir -p /mnt/{sdrive,$USER,media,downloads,software,games}

if [ $OS = 'almalinux' ]; then
  sudo dnf install -y nfs-utils cifs-utils 
elif [ $OS = 'ubuntu' ]; then
  sudo apt install -y nfs-common cifs-utils
fi

sudo mount -t cifs -o credentials=/home/neil/.smbcredentials //share/share /mnt/sdrive/
sudo mount -t nfs nas:/data/media/ /mnt/media
sudo mount -t nfs nas:/data/downloads/ /mnt/downloads/
sudo mount -t nfs nas:/data/software/ /mnt/software/
sudo mount -t nfs nas:/data/games/ /mnt/games/
sudo mount -t nfs nas:/data/home/$USER/ /mnt/$USER/
