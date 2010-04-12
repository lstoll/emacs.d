;;; defuns.el --- Define some custom functions

;; Makes load time faster.
(defun byte-recompile-home ()
  (interactive)
    (byte-recompile-directory "~/.emacs.d" 0))

;; Refresh the file.
(defun refresh-file ()
  (interactive)
    (revert-buffer t t t))
    (global-set-key [f5] 'refresh-file)

;; Full screen toggle
(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen (if (frame-parameter nil 'fullscreen)
                                           nil
                                         'fullboth)))

;; Sets path from login shell path
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell 
      (replace-regexp-in-string "[[:space:]\n]*$" "" 
        (shell-command-to-string "$SHELL -l -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(when (equal system-type 'darwin) (set-exec-path-from-shell-PATH))

(provide 'conf/defuns)
;;; starter-kit-defuns.el ends here
