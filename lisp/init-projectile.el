;;; Projective
(require-package 'projectile)
(require-package 'helm-projectile)

(projectile-global-mode)

(global-set-key (kbd "C-c h") 'helm-projectile)

(helm-projectile-on)

(provide 'init-projectile)
