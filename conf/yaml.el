; yaml mode
(require 'yaml-mode)

; Auto indent
(add-hook 'yaml-mode-hook
      '(lambda ()
        (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

(provide 'conf/yaml)
