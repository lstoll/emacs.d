(require-package 'yaml-mode)

(defun customizations-for-yaml-mode ()
  (auto-complete-mode)
  )

(add-hook 'yaml-mode-hook 'customizations-for-yaml-mode)

(provide 'init-yaml)
