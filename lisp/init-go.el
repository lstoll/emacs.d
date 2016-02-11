(require-package 'go-mode)
(require-package 'go-autocomplete)

; dafuq is up with autoloads?
;(load "go-mode.el")

(require 'go-autocomplete)
(setq-default ac-go-expand-arguments-into-snippets t)

; Installed by thesetup
(load-file (concat "/Users/" (getenv "USER") "/src/golang.org/x/tools/cmd/oracle/oracle.el"))
(load-file (concat "/Users/" (getenv "USER") "/src/golang.org/x/tools/refactor/rename/go-rename.el"))

(defun my-go-mode-hook ()
  ;; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ;; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)

  (setq tab-width 4)

  (setq ac-sources '(ac-source-go ac-source-yasnippet))
  )
(add-hook 'go-mode-hook 'my-go-mode-hook)

(setq-default flycheck-go-test-executable "~/.emacs.d/bin/go_godep_shim")
(setq-default flycheck-go-build-executable "~/.emacs.d/bin/go_godep_shim")

(provide 'init-go)
