# One day, when I need to, I should test for the existence of this emacs, and if not just use emacs
EMACS ?= /Applications/Emacs.app/Contents/MacOS/Emacs

byte-compile:
		$(EMACS) -Q -L . -batch --eval '(byte-recompile-directory "." 0)'

clean:
		find . -name "*.elc" -exec rm {} \;

all: byte-compile

clean-recompile: clean byte-compile
