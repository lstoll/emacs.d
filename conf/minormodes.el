;;; defuns.el --- Define some custom functions

;; Snippets
(add-to-list 'load-path (concat dotfiles-dir "/vendor/yasnippet-0.6.1c"))
(require 'yasnippet)
(yas/initialize)
(yas/load-directory (concat dotfiles-dir "/snippets"))

;; make hippie expand
;; work nicely with yasnippet
(require 'hippie-exp)
(setq hippie-expand-try-functions-list
      '(yas/hippie-try-expand
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        ;;        try-expand-dabbrev-from-kill
        ;;         try-complete-file-name
        ;;         try-complete-file-name-partially
        ;;         try-complete-lisp-symbol
        ;;         try-complete-lisp-symbol-partially
        ;;         try-expand-line
        ;;         try-expand-line-all-buffers
        ;;         try-expand-list
        ;;         try-expand-list-all-buffers
        ;;        try-expand-whole-kill
        ))

;; textmate mode
(add-to-list 'load-path (concat dotfiles-dir "/vendor/textmate"))
(require 'textmate)
(textmate-mode)

;; load misc modes
(require 'whitespace)

;; IMenu support for CC mode
(require 'cc-menus)

;; Ruby compilation
(require 'ruby-compilation)

;; GIST
(add-to-list 'load-path (concat dotfiles-dir "/vendor/gist"))
(require 'gist)

;; MaGIT
(add-to-list 'load-path (concat dotfiles-dir "/vendor/magit"))
(require 'magit)


(provide 'conf/minormodes)
;;; starter-kit-defuns.el ends here
