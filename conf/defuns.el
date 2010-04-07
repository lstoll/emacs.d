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

(provide 'conf/defuns)
;;; starter-kit-defuns.el ends here
