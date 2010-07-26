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

;; Better kill ring browsing
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings) ; M-y
; when closing, keep same window state
(setq browse-kill-ring-quit-action 'save-and-restore)

;; Shorter modelines
(when (require 'diminish nil 'noerror)
;; Disabling for now, removes the in progress and errors indicators
;  (eval-after-load "flymake"
;     '(diminish 'flymake-mode "FlM"))
  (eval-after-load "textmate"
    '(diminish 'textmate-mode "TM"))
  (eval-after-load "ruby-electric-mode"
    '(diminish 'ruby-electric-mode "Elec"))
;  (eval-after-load "scala-mode-feature-electric"
;    '(diminish 'scala-electric-mode "Elec")))
)
(add-hook 'ruby-mode-hook 
  (lambda()
    (setq mode-name "rb"))) 

;(add-hook 'scala-mode-hook 
;  (lambda()
;    (setq mode-name "scla"))) 

; Fix for remote editing with transmit.
; See http://justinlilly.com/blog/2008/nov/05/emacs-and-transmit-remote-edit-fix/
(setq backup-by-copying t)

(provide 'conf/misc)
;;; starter-kit-defuns.el ends here
