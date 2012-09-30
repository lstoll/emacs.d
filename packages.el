;; Contains the list of packages we are using

(setq el-get-sources
      '(;;(:name ruby-mode
        ;;       :type elpa
        ;;       :load "ruby-mode.el"
        ;;       :after (lambda() (load "conf/ruby")))
        ;;(:Name textmate
        ;;       :type git
        ;;       :url "git://github.com/defunkt/textmate.el"
        ;;       :load "textmate.el"
        ;;       :after (lambda() (textmate-mode)))
        ;;(:name clojure-mode
        ;;       :after
        ;;       (lambda () (add-hook 'clojure-mode-hook 'paredit-mode)))
        ;; (:name paredit
               ;; :url "https://raw.github.com/emacsmirror/paredit/master/paredit.el")
        ;;(:name python
        ;;       :after (lambda () (load "conf/python")))
        ;;(:name ack-and-a-half
        ;;       :type git
        ;;       :url "https://github.com/jhelwig/ack-and-a-half.git"
        ;;       :load "ack-and-a-half.el")
        ;;(:name scala-mode
        ;;       :after (lambda () (load "conf/scala")))
        ;;(:name go-mode
        ;;       :after (lambda () (load "conf/go")))
        ;;(:name flymake-jslint
        ;;       :type git
        ;;       :url "git://github.com/purcell/flymake-jslint.git"
        ;;       :load "flymake-jslint.el"
        ;;       :after (lambda() (add-hook 'js-mode-hook 'flymake-jslint-load)))
        ;;(:name flymake-coffee
        ;;       :type git
        ;;       :url "git://github.com/purcell/flymake-coffee.git"
        ;;       :load "flymake-coffee.el"
        ;;       :after (lambda() (add-hook 'coffee-mode-hook 'flymake-coffee-load)))
        (:name inf-ruby
               :type git
               :url "git://github.com/nonsequitur/inf-ruby.git")
        (:name ruby-electric
               :type git
               :url "git://github.com/qoobaa/ruby-electric.git")
        ))


(setq my-packages
      (append
       '(
         ;; ruby-mode ; built-in
         textmate
         clojure-mode
         paredit
         python
         ;; ruby-electric
         ;; ruby-compilation
         yaml-mode
         css-mode
         auto-complete
         auto-complete-ruby
         ;; ac-python
         ac-slime
         markdown-mode
         coffee-mode
         flymake-ruby
         textile-mode
         ;;haml-mode
         ;;sass-mode
         magit
         smex
         rhtml-mode
         ack
         ;;rinari ; fails if listed to install.
         column-marker
         )
         ;magithub)
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)
