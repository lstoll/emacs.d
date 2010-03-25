;; DESCRIPTION: my settings

;; Manually set PATH for use by eshell, rspec-mode, etc.
(let ((path))
  (setq path (concat "~/.rvm/rubies/ruby-1.9.1-p378/bin/:"
                     "~/sw/bin:"
                     "/usr/local/bin:"
                     "/usr/bin:"
                     "/bin"))
  (setenv "PATH" path))

; vendor is on load path
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))

;; Save backups in one place
;; Put autosave files (ie #foo#) in one place, *not*
;; scattered all over the file system!
(defvar autosave-dir
  (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))
(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
          (if buffer-file-name
              (concat "#" (file-name-nondirectory buffer-file-name) "#")
            (expand-file-name
             (concat "#%" (buffer-name) "#")))))

;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))

;; Makes load time faster.
(defun byte-recompile-home ()
  (interactive)
  (byte-recompile-directory "~/.emacs.d" 0))

; Tabs
(setq default-tab-width 4)
(setq tab-width 4)

;; Plain Text
;;; Stefan Monnier <foo at acm.org>. It is the opposite of
;;; fill-paragraph. Takes a multi-line paragraph and makes
;;; it into a single line of text.
(defun unfill-paragraph ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

; Refresh the file.
(defun refresh-file ()
  (interactive)
  (revert-buffer t t t))
(global-set-key [f5] 'refresh-file)

;; Snippets
;(yas/load-directory (concat dotfiles-dir "/vendor/yasnippet.el/snippets"))

;; Commands
(require 'unbound)

;; Minor Modes
(textmate-mode)
(require 'whitespace)

;; Major Modes

;; ruby-mode
(require 'topfunky-sinatra)
(add-to-list 'load-path (concat dotfiles-dir "/vendor/ruby-complexity"))
(require 'linum)
(require 'ruby-complexity)
(add-hook 'ruby-mode-hook
          (function (lambda ()
                      (flymake-mode)
                      (linum-mode)
                      (ruby-complexity-mode)
                      )))

;; Javascript
(setq js2-basic-offset 2)
(setq js2-auto-indent-flag nil)
(setq javascript-indent-level 2)
(require 'topfunky-js)

(add-hook 'javascript-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command)
                 (let ((file (file-name-nondirectory buffer-file-name)))
                   (concat "java -classpath ~/src/rhino1_7R2/build/classes org.mozilla.javascript.tools.shell.Main ~/bin/src/jslint.js " file)))))


;; Remove scrollbars and make hippie expand
;; work nicely with yasnippet
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(require 'hippie-exp)
(setq hippie-expand-try-functions-list
      '(yas/hippie-try-expand
        try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        ;;        try-expand-dabbrev-from-kill
        ;;         try-complete-file-name
        ;;         try-complete-file-name-partially
        ;;         try-complete-lisp-symbol
        ;;         try-complete-lisp-symbol-partially
        ;;         try-expand-line
        ;;         try-expand-line-all-buffers
        ;;         try-expand-list
        ;;         try-expand-list-all-buffers
        ;;        try-expand-whole-kill
        ))

; Tab indexts or completes, depending on where it's at.
(defun indent-or-complete ()
  (interactive)
  (if (and (looking-at "$") (not (looking-back "^\\s-*")))
      (hippie-expand nil)
    (indent-for-tab-command)))
(add-hook 'find-file-hooks (function (lambda ()
                                       (local-set-key (kbd "TAB") 'indent-or-complete))))

;; org-mode
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

;; Override
(add-hook 'org-mode-hook
          (lambda()
            (local-set-key [(control meta return)] 'org-insert-heading)
            (local-set-key [(control shift left)] 'previous-buffer)
            (local-set-key [(control shift right)] 'next-buffer)
            (local-set-key [(meta shift right)] 'ido-switch-buffer)
            (local-set-key [(meta shift left)] 'magit-status)
            ))


(require 'textile-mode)
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))

(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.mdown\\'" . markdown-mode))

; mode settings
(add-to-list 'auto-mode-alist '("\\.haml$" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.sass$" . sass-mode))

(add-to-list 'auto-mode-alist '("\\.sake\\'" . ruby-mode))

(require 'cc-menus)

;; Color Themes
(add-to-list 'load-path (concat dotfiles-dir "/vendor/color-theme"))
(require 'color-theme)
(color-theme-initialize)

;; Show line numbers?
(require 'line-num)

;; Full screen toggle
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                         'fullboth)))
(global-set-key (kbd "M-n") 'toggle-fullscreen)


;; Keyboard

;; Keyboard Overrides
(define-key textile-mode-map (kbd "M-s") 'save-buffer)
(define-key text-mode-map (kbd "M-s") 'save-buffer)

; maybe?
(global-set-key [(meta shift left)] 'magit-status)

(global-set-key [(control shift left)] 'previous-buffer)
(global-set-key [(control shift right)] 'next-buffer)

(global-set-key [(control \])] 'indent-rigidly)

;; Other

(prefer-coding-system 'utf-8)

; yaml mode
(load (concat dotfiles-dir "vendor/yaml-mode/yaml-mode.el"))

(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))
(add-to-list 'auto-mode-alist '("\\.yaml$" . yaml-mode))

; Auto indent
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;; trying better theme handling. From http://emacs-fu.blogspot.com/2009/03/color-theming.html

; load vibrant ink
(load (concat dotfiles-dir "vendor/color-theme-vibrant-ink/color-theme-vibrant-ink.el"))

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


; File associations
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))


; set the colors
(custom-set-variables
     '(term-default-bg-color "#151515")    ;; background color (match theme)
     '(term-default-fg-color "#ffffff"))   ;; foreground color (white)
