(require-package 'popwin)
(require 'popwin)

(setq display-buffer-function 'popwin:display-buffer)

(add-to-list 'popwin:special-display-config '("*helm*" :height 20))
(add-to-list 'popwin:special-display-config '("*helm-mode-execute-extended-command*" :height 20))


(provide 'init-popwin)
