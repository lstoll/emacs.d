;;; Basic ruby setup
(require-package 'enh-ruby-mode)

(add-auto-mode 'enh-ruby-mode
               "Rakefile\\'" "\\.rake\\'" "\\.rxml\\'" "\\.rb\\'"
               "\\.rjs\\'" "\\.irbrc\\'" "\\.pryrc\\'" "\\.builder\\'" "\\.ru\\'"
               "\\.gemspec\\'" "Gemfile\\'" "Kirkfile\\'" "Berksfile\\'")

;(setq enh-ruby-program "/usr/bin/ruby")

(add-hook 'enh-ruby-mode-hook (lambda ()
				;; Always indent on newline
				(define-key enh-ruby-mode-map (kbd "RET") 'reindent-then-newline-and-indent)))

(setq enh-ruby-bounce-deep-indent t)
(setq enh-ruby-hanging-brace-indent-level 2)
(setq enh-ruby-deep-indent-paren nil)

(provide 'init-ruby)
