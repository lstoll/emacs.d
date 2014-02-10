;; Contains the list of packages we are using

(setq el-get-sources
      '(
        ;; Manual import from the auto-complete, popup and fuzzy.rcp, the repos have moved.
        (:name dash
               :type github
               :pkgname "magnars/dash.el"
               :checkout "2ee84cbe557adb054fae018aa563ce6604259b21")
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
        ;;(:name ac-nrepl
        ;;      :description "Nrepl completion source for Emacs auto-complete package"
        ;;      :type github
        ;;      :pkgname "purcell/ac-nrepl"
        ;;      :depends (auto-complete clojure-mode nrepl)
        ;;      :features ac-nrepl)
        (:name highlight-indentation
               :description "Highlighting indentation for Emacs"
               :type github
               :pkgname "antonj/Highlight-Indentation-for-Emacs")
        (:name ag
               :description "A simple ag frontend, loosely based on ack-and-half.el"
               :type github
               :pkgname "Wilfred/ag.el")
        (:name go-mode
               ;; go get -u code.google.com/p/rog-go/exp/cmd/godef
               :description "mode for golang"
               :type github
               :pkgname "dominikh/go-mode.el")
        (:name go-flymake
               ;; go get -u github.com/dougm/goflymake
               :description "flymake for go"
               :type github
               :pkgname "dougm/goflymake")
        (:name exec-path-from-shell
               :description "sets the PATH from shell"
               :type github
               :pkgname "purcell/exec-path-from-shell"
               :checkout "ab268a035a35fcf4db7ab0ed8c104e36759735e0")
        (:name go-autocomplete
               ;; go get -u github.com/nsf/gocode
               :description "auto complete for go"
               :type http
               :depends (auto-complete)
               :url "https://raw.github.com/nsf/gocode/master/emacs/go-autocomplete.el")
        (:name dash-at-point
               :description "opens dash document viewer for item at point"
               :type github
               :pkgname "stanaka/dash-at-point")
        (:name python
               :type github
               :pkgname "emacsmirror/python-mode"
               :checkout "977176ebd267c6fbf4698a8f0f86276046e96dca")
        (:name puppet-mode
               :type http
               :url "https://github.com/wfarr/dotfiles/raw/master/emacs.d/puppet-mode.el")
        (:name enh-ruby-mode
               :type github
               :pkgname "zenspider/enhanced-ruby-mode"
               :checkout "af0d40db655516765e756a2b2385d8c0007a68ac")
        (:name smartparens
               :type github
               :pkgname "Fuco1/smartparens"
               :checkout "0a8441f60bd98e8e578e82f67c7bfbe573c4476b"
               :depends dash)
        ))


(setq my-packages
      (append
       '(
         textmate
         clojure-mode
         paredit
         yaml-mode
         auto-complete
         markdown-mode
         coffee-mode
         flymake-ruby
         textile-mode
         ;magit
         smex
         rhtml-mode
         column-marker
         )
       (mapcar 'el-get-source-name el-get-sources)
       ))

(el-get 'sync my-packages)
