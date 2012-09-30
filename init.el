;; Emacs Configuration

; Emacs home dir on load path
(add-to-list 'load-path "~/.emacs.d")

; Start the server
(server-start)

; Globals - General global config
(load "conf/global")

; Key bindings
(load "conf/bindings")

; Shell
(load "conf/shell")

; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil t)
       (with-current-buffer
           (url-retrieve-synchronously
            "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
         (goto-char (point-max))
         (eval-print-last-sexp)))

(require 'el-get)

; Actual package list - hand over, it will load the configs on a per package
; basis
(load "packages")

;; Various config items. TODO - break these out better
(load "conf/ruby")
(textmate-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(load "conf/python")

(add-hook 'ruby-mode-hook (lambda () (interactive) (column-marker-1 80)))
