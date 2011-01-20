#!/bin/bash
# This allows me to use the emacsclient alternate editor to start the GUI and server
# if it's not already running, opening the file in the GUI
if [ ! -f "$1" ]; then
  touch "$1"
fi

if [ -e $(brew --prefix --HEAD emacs)/Emacs.app ]; then
  open -a `brew --prefix --HEAD emacs`/Emacs.app "$1"
else
  open -a `brew --prefix emacs`/Emacs.app "$1"
fi
