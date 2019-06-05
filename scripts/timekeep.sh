#!/bin/bash

# Quick and dirty script to log timestamps and a 'category' to a file.

notify-send -t 3000 $1 && echo $(date +%FT%T),$1 >> $HOME/timekeeping.csv

# Source the pipenv that aw-watcher-cli lives in.
source /usr/local/google/home/wxorxornull/.local/share/virtualenvs/aw-watcher-cli-5KP3Yw5L/bin/activate
aw-watcher-cli -d $1
