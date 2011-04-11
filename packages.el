;; Contains the list of packages we are using

(setq el-get-sources
      '((:name vimpulse
              :type git
              :url "git://gitorious.org/vimpulse/vimpulse.git"
              :load "vimpulse.el"
              :after (lambda()
                       (load "conf/dot-viper")
                       (load "conf/vimpulse")))
        (:name ruby-electric
               :type elpa)
        (:name ruby-mode
               :type elpa
               :load "ruby-mode.el"
               :after (lambda() (load "conf/ruby")))
        (:name inf-ruby 
               :type elpa
               :load "inf-ruby.el")
        (:name ruby-compilation :type elpa)
        (:name css-mode :type elpa)
        (:name textmate
               :type git
               :url "git://github.com/defunkt/textmate.el"
               :load "textmate.el"
               :after (lambda() (textmate-mode)))
        (:name rvm
               :type git
               :url "http://github.com/djwhitt/rvm.el.git"
               :load "rvm.el"
               :compile ("rvm.el")
               :after (lambda() (rvm-use-default)))
        (:name rhtml
               :type git
               :url "https://github.com/eschulte/rhtml.git"
               ; Compile errors - so compile nothing.
               :compile ()
               :features rhtml-mode)
        (:name yaml-mode
               :type git
               :url "http://github.com/yoshiki/yaml-mode.git"
               :features yaml-mode
               :after (lambda() (load "conf/yaml-mode")))
        (:name auto-complete
               :type git
               :url "http://cx4a.org/repo/auto-complete.git"
               :load "auto-complete.el"
               :after (lambda () (load "conf/auto-complete")))
        (:name clojure-mode
               :type elpa
               :load "clojure-mode.el")
        (:name slime
               :type elpa
               :load "slime.el")
        (:name slime-repl
               :type elpa
               :load "slime-repl.el")
        (:name paredit
               :type elpa
               :load "paredit.el")
        (:name python.el
               :type git
               :url "https://github.com/fgallina/python.el.git"
               :load "python.el"
               :after (lambda () (load "conf/python")))
        (:name coffee-mode
               :type git
               :url "git://github.com/defunkt/coffee-mode.git"
               :features coffee-mode)
        (:name markdown-mode)
        ))

; Do this sync, so required packages are installed and loaded before running
(el-get 'sync)
