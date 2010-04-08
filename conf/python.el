;; flymake
(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
               'flymake-create-temp-inplace))
       (local-file (file-relative-name
            temp-file
            (file-name-directory buffer-file-name))))
      (list "~/.emacs.d/bin/pycheckers.sh"  (list local-file))))
   (add-to-list 'flymake-allowed-file-name-masks
             '("\\.py\\'" flymake-pyflakes-init)))

(add-hook 'python-mode-hook 
      (lambda () 
        (unless (eq buffer-file-name nil) (flymake-mode 1)) ;dont invoke flymake on temporary buffers for the interpreter
        ;(local-set-key [f2] 'flymake-goto-prev-error)
        ;(local-set-key [f3] 'flymake-goto-next-error)
        ))



(provide 'conf/python)
