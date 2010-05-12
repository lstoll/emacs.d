;;; init.el --- Where all the magic begins
;;
;; Part of the Emacs Starter Kit
;;
;; This is the first thing to get loaded.
;;
;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"

;; Load path etc:

(setq dotfiles-dir (file-name-directory
                    (or (buffer-file-name) load-file-name)))
(add-to-list 'load-path dotfiles-dir)
(add-to-list 'load-path (concat dotfiles-dir "/vendor"))
(setq autoload-file (concat dotfiles-dir "loaddefs.el"))
(setq custom-file (concat dotfiles-dir "custom.el"))

;; Manually set PATH for use by eshell, rspec-mode, etc.
(let ((path))
  (setq path (concat "~/.rvm/rubies/ruby-1.9.1-p378/bin/:"
                     "~/sw/bin:"
                     "/usr/local/bin:"
                     "/usr/bin:"
                     "/bin"))
  (setenv "PATH" path))

;; These should be loaded on startup rather than autoloaded on demand
;; since they are likely to be used in every session:

(require 'cl)
(require 'saveplace)
(require 'ffap)
(require 'uniquify)
(require 'ansi-color)
(require 'recentf)

;; Load starter kit function defs
(require 'conf/starter-kit-defuns)

;; Rebuild autoloads and customizations
(load custom-file 'noerror)

;; Set the debug option to enable a backtrace when a
;; problem occurs.
;(setq debug-on-error t)

;; You can keep system-specific customizations here:
(setq system-specific-config (concat dotfiles-dir system-name ".el"))
(if (file-exists-p system-specific-config) (load system-specific-config))

;; Load other configs
(require 'conf/defuns)
(require 'conf/editing)
(require 'conf/bindings)
(require 'conf/starter-kit-misc)
(require 'conf/flymake)
(require 'conf/registers)
(require 'conf/eshell)
(require 'conf/ruby)
(require 'conf/python)
(require 'conf/hamlsass)
(require 'conf/js)
(require 'conf/misc)
(require 'conf/orgmode)
(require 'conf/colorthemes)
(require 'conf/yaml)
(require 'conf/nxhtml)
(require 'conf/fileassoc)
(require 'conf/jdee)
(require 'conf/scala)
; I think this needs to be last, to ensure all deps loaded
(require 'conf/otherloads)

(provide 'init)
;;; init.el ends here


