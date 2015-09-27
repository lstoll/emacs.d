(require-package 'maxframe)

(add-hook 'window-setup-hook 'maximize-frame t)

;; 12 Retina needs this for whatever reason
(setq mf-display-padding-height 60)

(setq mf-max-width 1600)

(provide 'init-maxframe)
