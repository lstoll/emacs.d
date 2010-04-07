; yaml mode
(load (concat dotfiles-dir "vendor/yaml-mode/yaml-mode.el"))

; Auto indent
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(provide 'conf/yaml)
