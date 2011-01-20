;; Config for packing systems

; ELPA
(require 'package)
(setq package-archives (cons '("tromey" . "http://tromey.com/elpa/") package-archives))
(package-initialize)

; el-get
(add-to-list 'load-path "~/.emacs.d/vendor/el-get")
(require 'el-get)
