(add-to-list 'load-path (concat dotfiles-dir "/vendor/vimpulse"))
(require 'vimpulse)

(setq viper-inhibit-startup-message 't)
(setq viper-expert-level '5)

; Ruby mode wants to stay in emacs - force it to vi
(add-to-list 'viper-vi-state-mode-list 'ruby-mode)

(provide 'conf/vimpulse)
