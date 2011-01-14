# One day, when I need to, I should test for the existence of this emacs, and if not just use emacs
EMACS = emacs

byte-compile:
		# -Q (q?)
		#$(EMACS) -L . -batch --eval '(byte-recompile-directory "." 0)'
		$(EMACS) -l init.el -batch --eval '(byte-recompile-directory "." 0)'

clean:
		find . -name "*.elc" -exec rm {} \;

all: byte-compile

clean-recompile: clean byte-compile
