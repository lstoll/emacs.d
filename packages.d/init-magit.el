;; change magit diff colors
(eval-after-load 'magit
  ;; no highlight
  '(progn
     (defun magit-highlight-section ())
     (set-face-foreground 'magit-diff-add "green3")
     (set-face-foreground 'magit-diff-del "red3")
     (when (not window-system)
       (set-face-background 'magit-item-highlight "black"))))
