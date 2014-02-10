(setq enh-ruby-program "/usr/bin/ruby") ; because rbenv otherwise
(setq enh-ruby-deep-indent-paren nil)
(add-to-list 'auto-mode-alist '("\\(Gemfile\\|Puppetfile\\|Vagrantfile\\|\\.rb\\)$" . enh-ruby-mode))
