;;; starter-kit-bindings.el --- Set up some handy key bindings
;;
;; Part of the Emacs Starter Kit.

;; Use regex searches by default.
(global-set-key "\C-s" 'isearch-forward-regexp)
(global-set-key "\C-r" 'isearch-backward-regexp)
(global-set-key "\C-\M-s" 'isearch-forward)
(global-set-key "\C-\M-r" 'isearch-backward)

;; Jump to a definition in the current file. (This is awesome.)
(global-set-key "\C-x\C-i" 'ido-imenu)

;; File finding
(require 'recentf)
(recentf-mode 1)
(defun recentf-ido-find-file ()
  "Find a recent file using Ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))
(global-set-key (kbd "C-x f") 'recentf-ido-find-file)
(global-set-key (kbd "M-`") 'file-cache-minibuffer-complete)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Window switching. (C-x o goes to the next window)
(windmove-default-keybindings) ;; Shift+direction
; Fix with org-mode
(add-hook 'org-shiftup-final-hook 'windmove-up)
(add-hook 'org-shiftleft-final-hook 'windmove-left)
(add-hook 'org-shiftdown-final-hook 'windmove-down)
(add-hook 'org-shiftright-final-hook 'windmove-right)

;; Help should search more than just commands
(global-set-key (kbd "C-h a") 'apropos)

; Buffer switching
(global-set-key [(control shift left)] 'previous-buffer)
(global-set-key [(control shift right)] 'next-buffer)

;; el-get status
(global-set-key (kbd "C-x g") 'magit-status)

;; Smex
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;; f7 for shell switching
(global-set-key [f7] 'alt-shell-dwim)

;; Flymake
(global-set-key (kbd "C-c d") 'flymake-display-err-menu-for-current-line)
(global-set-key (kbd "C-c v") 'flymake-goto-next-error)
