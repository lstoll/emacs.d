(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
