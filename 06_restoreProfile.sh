#!/bin/bash
## restore from backup
export BACKUPFOLDER=/data/profileBackup/$USER
if [ ! -d $BACKUPFOLDER ]; then
  mkdir -p $BACKUPFOLDER
fi

rsync --archive --no-motd --verbose --progress --update $BACKUPFOLDER/Desktop $HOME/
rsync --archive --no-motd --verbose --progress --update $BACKUPFOLDER/Documents $HOME/
rsync --archive --no-motd --verbose --progress --update $BACKUPFOLDER/Downloads $HOME/
rsync --archive --no-motd --verbose --progress --update $BACKUPFOLDER/Music $HOME/
rsync --archive --no-motd --verbose --progress --update $BACKUPFOLDER/Pictures $HOME/
rsync --archive --no-motd --verbose --progress --update $BACKUPFOLDER/Templates $HOME/
rsync --archive --no-motd --verbose --progress --update $BACKUPFOLDER/Videos $HOME/
rsync --archive --no-motd --verbose --progress --update $BACKUPFOLDER/Applications $HOME/
rsync --archive --no-motd --verbose --progress --update $BACKUPFOLDER/.ssh $HOME/
if [ -d $HOME/joplinBackup/ ]; then
  rsync --archive --no-motd --verbose --progress --update $BACKUPFOLDER/joplinBackup  $HOME/
fi
rsync --archive --no-motd --verbose --progress --update $BACKUPFOLDER/.config/Joplin  $HOME/.config/
rsync --archive --no-motd --verbose --progress --update $BACKUPFOLDER/.config/joplin-desktop $HOME/.config/
rsync --archive --no-motd --verbose --progress --update $BACKUPFOLDER/.config/thorium $HOME/.config/

rsync --archive --no-motd --verbose --progress --update $BACKUPFOLDER/.local/share/gnome-shell/extensions $HOME/.local/share/gnome-shell/extensions
