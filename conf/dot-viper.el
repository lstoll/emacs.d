;; Don't use vi-style autoindent
(setq viper-auto-indent nil)

;; Enable electric autoindent
(setq viper-electric-mode t)

;; Enable regex search
(setq viper-re-search t)

;; :set sw
(setq viper-shift-width 2)

;; Enable C-h for standard emacs help
(setq viper-want-ctl-h-help t)

;; Disable vi-style keybindings in minibuffer
(setq viper-vi-style-in-minibuffer nil)

;; Force viper vi mode in major modes
(add-to-list 'viper-vi-state-mode-list 'ruby-mode)

;; Force emacs mode in major modes
(add-to-list 'viper-emacs-state-mode-list 'magit-key-mode)
