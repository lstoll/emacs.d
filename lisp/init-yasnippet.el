(require-package 'yasnippet)

(yas-global-mode 1) ;; or M-x yas-reload-all if you've started YASnippet already.

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets/personal"
        "~/.emacs.d/snippets/go-mode"
        ))

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "M-TAB") 'yas-expand)

(provide 'init-yasnippet)
