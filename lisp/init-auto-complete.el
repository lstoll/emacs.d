;;; Basic ruby setup
(require-package 'auto-complete)

(global-auto-complete-mode t)

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

(add-to-list 'ac-modes 'coffee-mode)
(add-to-list 'ac-modes 'enh-ruby-mode)

(provide 'init-auto-complete)
