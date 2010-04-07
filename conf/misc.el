;;; defuns.el --- Define some custom functions

;; List unbound keys
(require 'unbound)

;; Remove scrollbars
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(prefer-coding-system 'utf-8)

(provide 'conf/misc)
;;; starter-kit-defuns.el ends here
