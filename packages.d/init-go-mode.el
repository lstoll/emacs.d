(add-hook 'go-mode-hook
          (lambda ()
            (setq tab-width 4)
            (auto-complete-mode)
            (add-hook 'before-save-hook 'gofmt-before-save)))
