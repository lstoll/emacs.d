# Emacs Config

For Emacs 24.

    brew install emacs --cocoa --use-git-head --HEAD

## Requirements

XML Starlet (http://xmlstar.sourceforge.net/) for XML flymake. Download and install using

    ./configure `brew diy` && make install && brew link xmlstarlet

Requires pylint, pyflakes, and pep8 for Python flymake.

    pip install pylint && pip install pyflakes && pip install pep8

## Aliases

Some useful shell aliases

    # Opens file in emacs, starting it if not already running
    alias ec="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -n -a ~/.emacs.d/bin/emacs-gui.sh"
    # Opens file in terminal using existing emacs backend, otherwise starts GUI and opens there.
    # Could modify to be all terminal, but I like my emacs server running in the GUI
    alias et="/Applications/Emacs.app/Contents/MacOS/bin/emacsclient -t -a ~/.emacs.d/bin/emacs-gui.sh"

