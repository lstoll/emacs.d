;;; defuns.el --- Define some custom functions

;; List unbound keys
(require 'unbound)

;; Remove scrollbars
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; UTF 8
(prefer-coding-system 'utf-8)

;; Linum
(setq linum-format " %d ")
;(global-linum-mode 1)

;; Column number in footer
(column-number-mode 1)

;; When opened via cocoa (i.e drop file on icon, or dbl click)
;; open in a new window in existing frame, rather than new frame
(setq ns-pop-up-frames nil)

(provide 'conf/misc)
;;; starter-kit-defuns.el ends here
