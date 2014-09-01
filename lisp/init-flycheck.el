;;; Basic ruby setup
(require-package 'flycheck)

(after-load 'flycheck
  ;; Highlight whole line with error
  (setq flycheck-highlighting-mode 'lines))
  
(provide 'init-flycheck)

