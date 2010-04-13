;; Color Themes
(add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme"))
(require 'color-theme)
(color-theme-initialize)

;; trying better theme handling. From http://emacs-fu.blogspot.com/2009/03/color-theming.html

; load vibrant ink
(load (concat dotfiles-dir "vendor/color-theme-vibrant-ink/color-theme-vibrant-ink.el"))

; Load topfuny
;(load (concat dotfiles-dir "vendor/topfunky-theme.el"))

; This all makes sure we load the color theme in gui, and something
; nicer in console.
(defvar after-make-console-frame-hooks '()
"Hooks to run after creating a new TTY frame")
(defvar after-make-window-system-frame-hooks '()
"Hooks to run after creating a new window-system frame")

(defun run-after-make-frame-hooks (frame)
"Selectively run either `after-make-console-frame-hooks' or
`after-make-window-system-frame-hooks'"
(select-frame frame)
(run-hooks (if window-system
'after-make-window-system-frame-hooks
'after-make-console-frame-hooks)))

(add-hook 'after-make-frame-functions 'run-after-make-frame-hooks)
(add-hook 'after-init-hook
(lambda ()
(run-after-make-frame-hooks (selected-frame))))

(set-variable 'color-theme-is-global nil)
(add-hook 'after-make-window-system-frame-hooks 'color-theme-vibrant-ink)
(add-hook 'after-make-console-frame-hooks 'color-theme-tty-dark)

; set the colors for term
(custom-set-variables
     '(term-default-bg-color "#151515")    ;; background color (match theme)
     '(term-default-fg-color "#ffffff"))   ;; foreground color (white)


(provide 'conf/colorthemes)
