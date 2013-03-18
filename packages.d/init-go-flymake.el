(require 'go-flymake)

(add-hook 'go-mode-hook
          (lambda ()
            (flymake-mode)))
