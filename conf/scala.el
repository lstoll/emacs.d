;(add-to-list 'load-path (concat dotfiles-dir "/vendor/scala-mode"))
(add-to-list 'load-path "~/.emacs.d/vendor/scala-mode")
(require 'scala-mode-auto)
(require 'scala-mode)

;(defun scala-turnoff-indent-tabs-mode ()
 ; (setq indent-tabs-mode nil))

;; scala mode hooks
;(add-hook 'scala-mode-hook 'scala-turnoff-indent-tabs-mode)

;; CTags
(semantic-mode 1)
;(load "semantic-ectag-scala.el")
;(semantic-load-enable-code-helpers)      ; Enable prototype help and smart completion 
;(global-srecode-minor-mode 1)            ; Enable template insertion menu
;;(semantic-load-enable-primary-exuberent-ctags-support)

;; This enables flymake using a makefile. Needs an entry like this:
;
;check-syntax:
;  -mkdir /tmp/twitter-chat-scala-build 2>/dev/null
;  fsc -classpath ${HOME}lib/cp1.jar:${HOME}/lib/cp2.jar -sourcepath app -d /tmp/twitter-chat-scala-build ${CHK_SOURCES}
;
(push '(".+\\.scala$" flymake-simple-make-init) flymake-allowed-file-name-masks)
; Turn on flymake by default for scala
(add-hook 'scala-mode-hook
	  (lambda () (flymake-mode-on)))
(add-hook 'scala-mode-hook
	  (lambda () (scala-electric-mode)))

;; From: http://stackoverflow.com/questions/1627645/emacs-newline-and-indent-in-scala-mode
(add-hook 'scala-mode-hook
      (lambda () (local-set-key (kbd "RET") 'reindent-then-newline-and-indent)))


;; Indentation code from http://snippets.dzone.com/posts/show/5013

(set (make-local-variable 'indent-line-function) 'scala-indent-line)

(defun scala-indent-line ()
  "Indent current line of Scala code."
  (interactive)
  (indent-line-to (max 0 (scala-calculate-indentation))))

(defun scala-calculate-indentation ()
  "Return the column to which the current line should be indented."
  (save-excursion
    (scala-maybe-skip-leading-close-delim)
    (let ((pos (point)))
      (beginning-of-line)
      (if (not (search-backward-regexp "[^\n\t\r ]" 1 0))
	  0
	(progn
	  (scala-maybe-skip-leading-close-delim)
	  (+ (current-indentation) (* 2 (scala-count-scope-depth (point) pos))))))))

(defun scala-maybe-skip-leading-close-delim ()
  (beginning-of-line)
  (forward-to-indentation 0)
  (if (looking-at "\\s)")
      (forward-char)
    (beginning-of-line)))

(defun scala-face-at-point (pos)
  "Return face descriptor for char at point."
  (plist-get (text-properties-at pos) 'face))

(defun scala-count-scope-depth (rstart rend)
  "Return difference between open and close scope delimeters."
  (save-excursion
    (goto-char rstart)
    (let ((open-count 0)
	  (close-count 0)
	  opoint)
      (while (and (< (point) rend)
		  (progn (setq opoint (point))
			 (re-search-forward "\\s)\\|\\s(" rend t)))
	(if (= opoint (point))
	    (forward-char 1)
	  (cond

            ;; Use font-lock-mode to ignore strings and comments
	   ((scala-face-at-point (- (point) 1))) 

	   ((looking-back "\\s)")
	    (incf close-count))
	   ((looking-back "\\s(")
	    (incf open-count))
	   )))
      (- open-count close-count))))


(provide 'conf/scala)
