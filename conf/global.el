; /usr/local at beginning of path
(push "/usr/local/bin" exec-path)
(setenv "PATH" (concat "/usr/local/bin:" (getenv "PATH")))

; Tabs are 2 spaces by default
(setq-default tab-width 2)

; Don't use tabs for indenting
(setq-default indent-tabs-mode nil)

; Don't show startup messages
(setq inhibit-startup-message t)

; Never require a full yes or no, y or n is OK
(fset 'yes-or-no-p 'y-or-n-p)

; Can delete a selected region
(delete-selection-mode t)

; No scroll bars
(scroll-bar-mode -1)

; No tool bar
(tool-bar-mode -1)

; Highlight the matching paren
(show-paren-mode t)

; Show column number in bar
(column-number-mode t)

; Don't show the fringe
(set-fringe-style -1)

; No tooltips
(tooltip-mode -1)

; Decent font choice
(set-frame-font "Meslo LG M DZ-12")

; Theme
(load-theme 'tango-dark)

; Always enable ido mode
(ido-mode t)

; Wrap at 80 chars
(set-default 'fill-column 80)

; Kill trailing whitespace on save
(add-hook 'before-save-hook (lambda () (delete-trailing-whitespace)))

; When opening by 'cocoa' (e.g drop on icon) open in existing frame
(setq ns-pop-up-frames nil)

;; Backup Files

; Save them in a central location
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/autosaves/\\1" t)))

; Create them by copying, so transmit can pick up saves.
(setq backup-by-copying t)

; Line numbers
(setq linum-format " %d ")
(global-linum-mode t)

; Return always indents
(define-key global-map (kbd "RET") 'newline-and-indent)
