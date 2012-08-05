;; Contains the list of packages we are using

(setq el-get-sources
      '((:name ruby-mode
               :type elpa
               :load "ruby-mode.el"
               :after (lambda() (load "conf/ruby")))
        (:name textmate
               :type git
               :url "git://github.com/defunkt/textmate.el"
               :load "textmate.el"
               :after (lambda() (textmate-mode)))
        (:name clojure-mode
               :after
               (lambda () (add-hook 'clojure-mode-hook 'paredit-mode)))
        (:name paredit)
        (:name python
               :after (lambda () (load "conf/python")))
        ;;(:name ack-and-a-half
        ;;       :type git
        ;;       :url "https://github.com/jhelwig/ack-and-a-half.git"
        ;;       :load "ack-and-a-half.el")
        (:name scala-mode
               :after (lambda () (load "conf/scala")))
        (:name go-mode
               :after (lambda () (load "conf/go")))
        (:name flymake-jslint
               :type git
               :url "git://github.com/purcell/flymake-jslint.git"
               :load "flymake-jslint.el"
               :after (lambda() (add-hook 'js-mode-hook 'flymake-jslint-load)))
        (:name flymake-coffee
               :type git
               :url "git://github.com/purcell/flymake-coffee.git"
               :load "flymake-coffee.el"
               :after (lambda() (add-hook 'coffee-mode-hook 'flymake-coffee-load)))
        ))


(setq my-packages
      (append
       '(ruby-electric
         inf-ruby
         ruby-compilation
         yaml-mode
         css-mode
         auto-complete
         auto-complete-ruby
         markdown-mode
         coffee-mode
         flymake-ruby
         textile-mode
         ;;haml-mode
         ;;sass-mode
         magit
         smex
         rhtml-mode)
         ;magithub)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)
