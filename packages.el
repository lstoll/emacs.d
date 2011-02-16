;; Contains the list of packages we are using

(setq el-get-sources
      '((:name vimpulse
              :type git
              :url "git://gitorious.org/vimpulse/vimpulse.git"
              :load "vimpulse.el"
              :after (lambda()
                       (load "conf/dot-viper")
                       (load "conf/vimpulse")))
        (:name ruby-mode
               :type elpa
               :load "ruby-mode.el")
        (:name inf-ruby  :type elpa)
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
        (:name coffee-mode
               :type git
               :url "git://github.com/defunkt/coffee-mode.git"
               :features coffee-mode)))

; Do this sync, so required packages are installed and loaded before running
(el-get 'sync)
