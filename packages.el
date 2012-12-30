;; Contains the list of packages we are using

(setq el-get-sources
      '(
        ;; (:name ac-nrepl
        ;;       :description "Nrepl completion source for Emacs auto-complete package"
        ;;       :type github
        ;;       :pkgname "purcell/ac-nrepl"
        ;;       :depends (auto-complete clojure-mode nrepl)
        ;;       :features ac-nrepl)
        ))


(setq my-packages
      (append
       '(
         textmate
         clojure-mode
         paredit
         python
         yaml-mode
         css-mode
         auto-complete
         ;; auto-complete-ruby
         markdown-mode
         coffee-mode
         flymake-ruby
         textile-mode
         magit
         smex
         rhtml-mode
         ack
         column-marker
         nrepl
         ruby-electric
         rainbow-delimiters
         )
       (mapcar 'el-get-source-name el-get-sources)
       ))

(el-get 'sync my-packages)
