((ac-nrepl status "installed" recipe
           (:name ac-nrepl :description "Nrepl completion source for Emacs auto-complete package" :type github :pkgname "purcell/ac-nrepl" :depends
                  (auto-complete clojure-mode nrepl)
                  :features ac-nrepl))
 (ack status "installed" recipe
      (:name ack :type http :localname "ack.el" :url "http://repo.or.cz/w/ShellArchive.git?a=blob_plain;hb=HEAD;f=ack.el" :shallow nil :description "Use ack where you might usually use grep." :features ack))
 (ag status "installed" recipe
     (:name ag :description "A simple ag frontend, loosely based on ack-and-half.el" :type github :pkgname "Wilfred/ag.el"))
 (auto-complete status "installed" recipe
                (:name auto-complete :website "http://cx4a.org/software/auto-complete/" :description "The most intelligent auto-completion extension." :type github :pkgname "auto-complete/auto-complete" :depends
                       (popup fuzzy)))
 (autopair status "installed" recipe
           (:name autopair :website "https://github.com/capitaomorte/autopair" :description "Autopair is an extension to the Emacs text editor that automatically pairs braces and quotes." :type github :pkgname "capitaomorte/autopair" :features autopair))
 (clojure-mode status "installed" recipe
               (:name clojure-mode :website "https://github.com/technomancy/clojure-mode" :description "Emacs support for the Clojure language." :type github :pkgname "technomancy/clojure-mode"))
 (coffee-mode status "installed" recipe
              (:name coffee-mode :website "http://ozmm.org/posts/coffee_mode.html" :description "Emacs Major Mode for CoffeeScript" :type github :pkgname "defunkt/coffee-mode" :features coffee-mode :post-init
                     (progn
                       (add-to-list 'auto-mode-alist
                                    '("\\.coffee$" . coffee-mode))
                       (add-to-list 'auto-mode-alist
                                    '("Cakefile" . coffee-mode))
                       (setq coffee-js-mode 'javascript-mode))))
 (column-marker status "installed" recipe
                (:name column-marker :description "Highlight certain character columns" :type emacswiki :features column-marker))
 (css-mode status "installed" recipe
           (:name css-mode :description "Minor mode for CSS" :features css-mode :type elpa))
 (dash-at-point status "installed" recipe
                (:name dash-at-point :description "opens dash document viewer for item at point" :type github :pkgname "stanaka/dash-at-point"))
 (el-get status "installed" recipe
         (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "4.stable" :pkgname "dimitri/el-get" :features el-get :info "." :load "el-get.el"))
 (exec-path-from-shell status "installed" recipe
                       (:name exec-path-from-shell :description "sets the PATH from shell" :type elpa :pkgname "exec-path-from-shell"))
 (flymake-ruby status "installed" recipe
               (:name flymake-ruby :description "Steve Purcell's Ruby Flymake support, with stricter warnings." :type http :url "https://gist.github.com/raw/758976/b4562bca1645a5567d02e97f04b1909401caa1ed/flymake-ruby.el" :features flymake-ruby :post-init
                      (add-hook 'ruby-mode-hook 'flymake-ruby-load)))
 (fuzzy status "installed" recipe
        (:name fuzzy :website "https://github.com/m2ym/fuzzy-el" :description "Fuzzy matching utilities for GNU Emacs" :type github :pkgname "auto-complete/fuzzy-el"))
 (go-autocomplete status "installed" recipe
                  (:name go-autocomplete :description "auto complete for go" :type http :depends
                         (auto-complete)
                         :url "https://raw.github.com/nsf/gocode/master/emacs/go-autocomplete.el"))
 (go-flymake status "installed" recipe
             (:name go-flymake :description "flymake for go" :type github :pkgname "dougm/goflymake"))
 (go-mode status "installed" recipe
          (:name go-mode :description "mode for golang" :type github :pkgname "dominikh/go-mode.el"))
 (highlight-indentation status "installed" recipe
                        (:name highlight-indentation :description "Highlighting indentation for Emacs" :type github :pkgname "antonj/Highlight-Indentation-for-Emacs"))
 (magit status "installed" recipe
        (:name magit :website "https://github.com/magit/magit#readme" :description "It's Magit! An Emacs mode for Git." :type github :pkgname "magit/magit" :info "." :autoloads
               ("50magit")
               :build
               (("make" "all"))
               :build/darwin
               `(,(concat "make EMACS=" el-get-emacs " all"))))
 (markdown-mode status "installed" recipe
                (:name markdown-mode :description "Major mode to edit Markdown files in Emacs" :type git :url "git://jblevins.org/git/markdown-mode.git" :post-init
                       (add-to-list 'auto-mode-alist
                                    '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
 (nrepl status "installed" recipe
        (:name nrepl :description "An Emacs client for nREPL, the Clojure networked REPL server." :type github :pkgname "kingtim/nrepl.el" :features nrepl))
 (package status "installed" recipe
          (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin 24 :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
                 (progn
                   (setq package-user-dir
                         (expand-file-name
                          (convert-standard-filename
                           (concat
                            (file-name-as-directory default-directory)
                            "elpa")))
                         package-directory-list
                         (list
                          (file-name-as-directory package-user-dir)
                          "/usr/share/emacs/site-lisp/elpa/"))
                   (make-directory package-user-dir t)
                   (unless
                       (boundp 'package-subdirectory-regexp)
                     (defconst package-subdirectory-regexp "^\\([^.].*\\)-\\([0-9]+\\(?:[.][0-9]+\\)*\\)$" "Regular expression matching the name of\n a package subdirectory. The first subexpression is the package\n name. The second subexpression is the version string."))
                   (setq package-archives
                         '(("ELPA" . "http://tromey.com/elpa/")
                           ("gnu" . "http://elpa.gnu.org/packages/")
                           ("marmalade" . "http://marmalade-repo.org/packages/")
                           ("SC" . "http://joseito.republika.pl/sunrise-commander/"))))))
 (paredit status "installed" recipe
          (:name paredit :description "Minor mode for editing parentheses" :type http :url "http://mumble.net/~campbell/emacs/paredit.el" :features "paredit"))
 (popup status "installed" recipe
        (:name popup :website "https://github.com/m2ym/popup-el" :description "Visual Popup Interface Library for Emacs" :type github :pkgname "auto-complete/popup-el"))
 (puppet-mode status "installed" recipe
              (:name puppet-mode :description "A simple mode for editing puppet manifests" :type http :url "https://raw.github.com/puppetlabs/puppet/master/ext/emacs/puppet-mode.el" :prepare
                     (progn
                       (autoload 'puppet-mode "puppet-mode" "Major mode for editing puppet manifests" t)
                       (add-to-list 'auto-mode-alist
                                    '("\\.pp$" . puppet-mode)))))
 (python status "installed" recipe
         (:name python :description "Python's flying circus support for Emacs" :type github :pkgname "fgallina/python.el"))
 (rainbow-delimiters status "installed" recipe
                     (:name rainbow-delimiters :website "https://github.com/jlr/rainbow-delimiters#readme" :description "Color nested parentheses, brackets, and braces according to their depth." :type github :pkgname "jlr/rainbow-delimiters" :features rainbow-delimiters))
 (rhtml-mode status "installed" recipe
             (:name rhtml-mode :description "Major mode for editing RHTML files" :type github :pkgname "eschulte/rhtml" :prepare
                    (progn
                      (autoload 'rhtml-mode "rhtml-mode" nil t)
                      (add-to-list 'auto-mode-alist
                                   '("\\.html.erb$" . rhtml-mode)))))
 (ruby-end status "installed" recipe
           (:name ruby-end :description "Emacs minor mode for automatic insertion of end blocks for Ruby" :type http :url "https://github.com/rejeep/ruby-end/raw/master/ruby-end.el" :features ruby-end))
 (smex status "installed" recipe
       (:name smex :description "M-x interface with Ido-style fuzzy matching." :type github :pkgname "nonsequitur/smex" :features smex :post-init
              (smex-initialize)))
 (textile-mode status "installed" recipe
               (:name textile-mode :description "Textile editing mode" :type http :url "http://dev.nozav.org/scripts/textile-mode.el" :prepare
                      (progn
                        (autoload 'textile-mode "textile-mode" "Textile editing mode." t)
                        (add-to-list 'auto-mode-alist
                                     '("\\.textile\\'" . textile-mode)))))
 (textmate status "installed" recipe
           (:name textmate :description "TextMate minor mode for Emacs" :type github :pkgname "defunkt/textmate.el" :features textmate :post-init
                  (textmate-mode)))
 (yaml-mode status "installed" recipe
            (:name yaml-mode :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode" :prepare
                   (progn
                     (autoload 'yaml-mode "yaml-mode" nil t)
                     (add-to-list 'auto-mode-alist
                                  '("\\.ya?ml\\'" . yaml-mode))))))
