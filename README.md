# Emacs Config

For Emacs 24.

    brew install emacs --cocoa --use-git-head --HEAD

## Requirements

Install this

    go get -u github.com/nsf/gocode
    go get -u github.com/dougm/goflymake
    go get -u code.google.com/p/rog-go/exp/cmd/godef

## Aliases

Some useful shell aliases

    # Opens file in emacs, starting it if not already running
    alias ec="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n -a ~/.emacs.d/bin/emacs-gui.sh"
    # Opens file in terminal using existing emacs backend, otherwise starts GUI and opens there.
    # Could modify to be all terminal, but I like my emacs server running in the GUI
    alias et="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -t -a ~/.emacs.d/bin/emacs-gui.sh"
