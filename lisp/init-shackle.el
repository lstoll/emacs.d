(require-package 'shackle)

(setq shackle-rules '(("\\`\\*helm.*?\\*\\'" :regexp t :align t :ratio 0.4)))

(shackle-mode)

(provide 'init-shackle)
