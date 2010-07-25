(add-hook 'scala-mode-hook
      (lambda () (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))
(add-hook 'sh-mode-hook
      (lambda () (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))


(provide 'conf/shell)
