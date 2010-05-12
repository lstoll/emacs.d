(require 'flymake)
; disable gui error boxes
(setq flymake-gui-warnings-enabled nil)

; Keyboard shortcuts
;; flymake show next error
(defun my-flymake-show-next-error() 
  (interactive)
  (flymake-goto-next-error)
  (flymake-display-err-menu-for-current-line))

(global-set-key (kbd "C-c C-v") 'my-flymake-show-next-error)
; Error for this line
(global-set-key (kbd "C-c d") 'flymake-display-err-menu-for-current-line)


;; Logging
;(setq flymake-log-level 3)


(provide 'conf/flymake)
