(require-package 'go-mode)
(require-package 'go-autocomplete)

(setenv "GOGC" "400")

; dafuq is up with autoloads?
(load "go-mode.el")

(require 'go-autocomplete)

; Installed by boxen
(load-file (concat "/Users/" (getenv "USER") "/gocode/src/golang.org/x/tools/cmd/oracle/oracle.el"))

(defun my-go-mode-hook ()
  ; Use goimports instead of go-fmt
  (setq gofmt-command "goimports")
  ; Call Gofmt before saving
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build -v && go test -v && go vet"))
  ; Godef jump key binding
  (local-set-key (kbd "M-.") 'godef-jump)
  ; Go Oracle
  ;(go-oracle-mode)

  ;(highlight-indentation-current-column-mode)

  (setq tab-width 4))
(add-hook 'go-mode-hook 'my-go-mode-hook)

(setq-default flycheck-go-test-executable "~/.emacs.d/bin/go_godep_shim")
(setq-default flycheck-go-build-executable "~/.emacs.d/bin/go_godep_shim")

(provide 'init-go)
