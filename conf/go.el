(add-hook 'go-mode-hook
          (lambda ()
            (setq tab-width 4)
            (auto-complete-mode)
            (add-hook 'before-save-hook #'gofmt-before-save)))

; Flymake
(require 'flymake)

(defun flymake-go-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))
    (list "go" (list "build" "-o" "/dev/null" temp-file))))

(push '(".+\\.go$" flymake-go-init) flymake-allowed-file-name-masks)

(add-hook 'go-mode-hook 'flymake-mode)
