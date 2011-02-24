;; Emacs Configuration

; Emacs home dir on load path
(add-to-list 'load-path "~/.emacs.d")

; Start the server
(server-start)

; Globals - General global config
(load "conf/global")

; Key bindings
(load "conf/bindings")

; Packaging - elpa, el-get, etc.
(load "conf/packaging")

; Actual package list - hand over, it will load the configs on a per package
; basis
(load "packages")
