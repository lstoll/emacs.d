(require-package 'popwin)

(require 'popwin)
(popwin-mode 1)

(setq popwin:popup-window-height 0.4)

(push '("^\*helm.+\*$" :regexp t) popwin:special-display-config)

;; disable popwin-mode in an active Helm session It should be disabled
;; otherwise it will conflict with other window opened by Helm persistent
;; action, such as *Help* window.
(add-hook 'helm-after-initialize-hook (lambda ()
                                          (popwin:display-buffer helm-buffer t)
                                          (popwin-mode -1)))

 ;;  Restore popwin-mode after a Helm session finishes.
 (add-hook 'helm-cleanup-hook (lambda () (popwin-mode 1)))


(provide 'init-popwin)
