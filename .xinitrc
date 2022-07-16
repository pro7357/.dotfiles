#!/usr/bin/bash

#$HOME/bash/alias/hotplug_monitor.sh
#$HOME/bash/alias/monitor_temp.sh &
keymap

##To log the output from i3, add this line instead:
#exec i3 -V >> ~/i3log-$(date +'%F-%k-%M-%S') 2>&1
xrdb -merge ~/.Xresources
exec i3
