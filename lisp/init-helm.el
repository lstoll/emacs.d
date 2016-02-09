(require-package 'helm)

(require 'helm-config)

(helm-mode 1)

(setq helm-recentf-fuzzy-match t
      helm-buffers-fuzzy-matching t
      helm-completion-in-region-fuzzy-match t
      helm-mode-fuzzy-match t
      helm-buffer-max-length nil)

(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-c t") 'helm-imenu)
(global-set-key (kbd "M-x") 'helm-M-x)

(provide 'init-helm)
