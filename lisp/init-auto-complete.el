;;; Basic ruby setup
(require-package 'auto-complete)

(global-auto-complete-mode t)

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)

(provide 'init-auto-complete)
