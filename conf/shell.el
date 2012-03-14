(add-hook 'term-mode-hook (lambda()
                             (setq tab-width 8)
                             (linum-mode 0)))

(defun alt-term-dwim (arg)
  "Run an inferior shell like `term'. If an inferior shell as its I/O
 through the current buffer, then pop the next buffer in `buffer-list'
 whose name is generated from the string \"*shell*\". When called with
 an argument, start a new inferior shell whose I/O will go to a buffer
 named after the string \"*shell*\" using `generate-new-buffer-name'."
  (interactive "P")
  (let* ((shell-buffer-list
          (let (blist)
            (dolist (buff (buffer-list) blist)
              (when (string-match "^\\*terminal\\*" (buffer-name buff))
                (setq blist (cons buff blist))))))
         (name (if arg
                   (generate-new-buffer-name "*terminal*")
                 (car shell-buffer-list))))
    (term name)))
