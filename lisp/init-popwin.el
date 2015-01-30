(require-package 'popwin)
(require 'popwin)

(setq display-buffer-function 'popwin:display-buffer)

(push '("^\\*helm" :regexp t :height 20) popwin:special-display-config)

(provide 'init-popwin)
