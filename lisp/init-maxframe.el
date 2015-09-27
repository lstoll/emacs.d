(require-package 'maxframe)

(add-hook 'window-setup-hook 'maximize-frame t)

(setq mf-max-width 1600)

(provide 'init-maxframe)
