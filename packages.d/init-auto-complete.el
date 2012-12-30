(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(require 'auto-complete-config)
(ac-config-default)

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
