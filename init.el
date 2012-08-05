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
  (url-retrieve
   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
   (lambda (s)
     (goto-char (point-max))
     (eval-print-last-sexp))))

(el-get 'sync)

; Actual package list - hand over, it will load the configs on a per package
; basis
(load "packages")
