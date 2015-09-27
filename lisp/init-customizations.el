;;; Customize the editor


;; Don't jank backups errywhere
(setq
 backup-by-copying t      ; don't clobber symlinks
 backup-directory-alist
 '(("." . "~/.emacs.d/backups"))    ; don't litter my fs tree
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)       ; use versioned backups


;; Recent file love

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

(defun recentf-ido-find-file ()
  "Find a recent file using ido."
  (interactive)
  (let ((file (ido-completing-read "Choose recent file: " recentf-list nil t)))
    (when file
      (find-file file))))

(global-set-key "\C-x\ f" 'recentf-ido-find-file)


;; There's gotta be a better place for this
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Fuck GUI shit
(menu-bar-mode -1)
(scroll-bar-mode -1) 
(tool-bar-mode -1)

;; Always highlight parens
(show-paren-mode 1)

;; Show column numbers
(setq column-number-mode t)

; Use a better unique buffer naming scheme
(require 'uniquify)
(setq
  uniquify-buffer-name-style 'post-forward-angle-brackets)

(define-key global-map (kbd "RET") 'newline-and-indent)

;; Overrite/delete selected region
(delete-selection-mode t)

(provide 'init-customizations)
