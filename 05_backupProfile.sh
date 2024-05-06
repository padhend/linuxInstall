#!/bin/bash
## create backup
export BACKUPFOLDER=/data/profileBackup/$USER
if [ ! -d $BACKUPFOLDER ]; then
  mkdir -p $BACKUPFOLDER
fi

rsync --archive --no-motd --verbose --progress --update $HOME/Desktop $BACKUPFOLDER/ 
rsync --archive --no-motd --verbose --progress --update $HOME/Documents $BACKUPFOLDER/
rsync --archive --no-motd --verbose --progress --update --exclude="*.iso" $HOME/Downloads $BACKUPFOLDER/
rsync --archive --no-motd --verbose --progress --update $HOME/Music $BACKUPFOLDER/
rsync --archive --no-motd --verbose --progress --update $HOME/Pictures $BACKUPFOLDER/
rsync --archive --no-motd --verbose --progress --update $HOME/Templates $BACKUPFOLDER/
rsync --archive --no-motd --verbose --progress --update $HOME/Videos $BACKUPFOLDER/
rsync --archive --no-motd --verbose --progress --update $HOME/Applications $BACKUPFOLDER/
rsync --archive --no-motd --verbose --progress --update $HOME/.ssh $BACKUPFOLDER/
if [ -d $HOME/joplinBackup/ ]; then
  rsync --archive --no-motd --verbose --progress --update $HOME/joplinBackup $BACKUPFOLDER/
fi
rsync --archive --no-motd --verbose --progress --update $HOME/.config/Joplin $BACKUPFOLDER/.config/
rsync --archive --no-motd --verbose --progress --update $HOME/.config/joplin-desktop $BACKUPFOLDER/.config/
rsync --archive --no-motd --verbose --progress --update $HOME/.config/thorium $BACKUPFOLDER/.config/

if [ ! -d $BACKUPFOLDER/.local/share/gnome-shell/extensions ]; then
  mkdir -p $BACKUPFOLDER/.local/share/gnome-shell/extensions
fi
rsync --archive --no-motd --verbose --progress --update $HOME/.local/share/gnome-shell/extensions $BACKUPFOLDER/.local/share/gnome-shell/extensions




