(add-to-list 'load-path (concat dotfiles-dir "/vendor/scala-mode"))
(require 'scala-mode-auto)

(defun scala-turnoff-indent-tabs-mode ()
  (setq indent-tabs-mode nil))

;; scala mode hooks
(add-hook 'scala-mode-hook 'scala-turnoff-indent-tabs-mode)

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


(provide 'conf/scala)
