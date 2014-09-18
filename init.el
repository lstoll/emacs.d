(let ((minver 24))
  (unless (>= emacs-major-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

(setq custom-file "~/.emacs.d/emacs-custom.el")
(load custom-file)

(start-server)

;;----------------------------------------------------------------------------
;; Bootstrap config
;;----------------------------------------------------------------------------
(require 'init-utils)
(require 'init-customizations)
(require 'init-site-lisp) ;; Must come before elpa, as it may provide package.el
(require 'init-elpa)      ;; Machinery for installing required packages
(require 'init-exec-path) ;; Set up $PATH

(require 'init-keybindings) ;; Set up our keybindings

;;----------------------------------------------------------------------------
;; Allow users to provide an optional "init-preload-local.el"
;;----------------------------------------------------------------------------
(require 'init-preload-local nil t)

;;----------------------------------------------------------------------------
;; Load configs for specific features and modes
;;----------------------------------------------------------------------------

(require 'init-ido)
(require 'init-solarized)
(require 'init-helm)
(require 'init-projectile)
(require 'init-flycheck)
(require 'init-ruby)
(require 'init-auto-complete)
(require 'init-popwin)
