#!/bin/bash
# This allows me to use the emacsclient alternate editor to start the GUI and server
# if it's not already running, opening the file in the GUI
if [ ! -f "$1" ]; then
  touch "$1"
fi

EMACSAPP=/Applications/Emacs.app # $(find `brew --prefix` -name Emacs.app)

#if [ -e $(brew --prefix --HEAD emacs)/Emacs.app ]; then
  open -a $EMACSAPP "$1"
#else
#  open -a $EMACSAPP "$1"
#fi
