;;; Basic ruby setup
(require-package 'auto-complete)

(global-auto-complete-mode t)

;;(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

(add-to-list 'ac-modes 'coffee-mode)
(add-to-list 'ac-modes 'enh-ruby-mode)

(ac-config-default)

(provide 'init-auto-complete)
