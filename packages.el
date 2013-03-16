;; Contains the list of packages we are using

(setq el-get-sources
      '(
        ;; Manual import from the auto-complete, popup and fuzzy.rcp, the repos have moved.
        (:name auto-complete
               :website "http://cx4a.org/software/auto-complete/"
               :description "The most intelligent auto-completion extension."
               :type github
               :pkgname "auto-complete/auto-complete"
               :depends (popup fuzzy))
        (:name popup
               :website "https://github.com/m2ym/popup-el"
               :description "Visual Popup Interface Library for Emacs"
               :type github
               :pkgname "auto-complete/popup-el")
        (:name fuzzy
               :website "https://github.com/m2ym/fuzzy-el"
               :description "Fuzzy matching utilities for GNU Emacs"
               :type github
               :pkgname "auto-complete/fuzzy-el")

        ;; Manual import from el-get master
        (:name ac-nrepl
               :description "Nrepl completion source for Emacs auto-complete package"
              :type github
              :pkgname "purcell/ac-nrepl"
              :depends (auto-complete clojure-mode nrepl)
              :features ac-nrepl)
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
         rainbow-delimiters
         ruby-end
         )
       (mapcar 'el-get-source-name el-get-sources)
       ))

(el-get 'sync my-packages)
