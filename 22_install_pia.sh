#!/bin/bash

## install Private Internet Access
FILENAME=pia-linux-3.5.7-08120.run
wget https://installers.privateinternetaccess.com/download/$FILENAME -P ~/Downloads/
chmod +x ~/Downloads/$FILENAME
~/Downloads/$FILENAME

