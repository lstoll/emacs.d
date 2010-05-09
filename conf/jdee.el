; cedet
(when (locate-library "cedet")
  (setq semantic-load-turn-everything-on t)
  (load "inversion")
  (load "cedet")
  )

;; semantic
(when (locate-library "semantic")
  (setq semanticdb-default-save-directory (expand-file-name (concat (getenv 
                                                              "HOME2") "/.emacs.d/semanticdb")))

  (setq semanticdb-default-system-save-directory (expand-file-name (concat 
                                                                     (getenv "HOME2") "/.emacs.d/semanticdb")))

  (setq semantic-load-turn-everything-on t)
  ) ;; end semantic

;; jdee mode

(add-to-list 'load-path (concat dotfiles-dir "/vendor/jdee/lisp"))
(when (locate-library "jde")

  ;(autoload 'jde-mode "jde" "Java Development Environment for Emacs." t)
  (require 'jde)
  (jde-set-variables-init-value)

  (setq auto-mode-alist
        (cons '("\\.java\\'" . jde-mode) auto-mode-alist))

  ;(setq jde-web-browser "firefox")

  ;; This breaks flymake - looks like it overwrites project vars
  ;(add-hook 'jde-mode-hook 'jde-set-variables-init-value)

  ;(setenv "JAVA_HOME" "/System/Library/Frameworks/JavaVM.framework/Versions/CurrentJDK/")

  (setq jde-jdk-registry
        '(("1.6" . "/System/Library/Frameworks/JavaVM.framework/Versions/1.6")))
  ;        ("1.2.2" . "c:/usr/local/share/java/sun/j2se/1.2.2/")))

  (setq jde-jdk '("1.6"))

  ;(setq jde-jdk-doc-url "C:/Program\ Files/Java/jdk1.6.0_18/docs/ja/api/index.html")

  ;(setq jde-help-docsets
  ;      '(("JDK API"
  ;         "C:/Program\ Files/Java/jdk1.6.0_18/docs/ja/api/"
  ;         "browse-url-default-browser")))

  ;; BeanShell
  (setq bsh-jar (concat dotfiles-dir "/vendor/jdee/java/lib/bsh.jar"))

  ;; Compiler
  ;; The old fashioned normal compiler
  ;(setq jde-compiler '("javac server" ""))
  (require 'jde-ecj-flymake)
  ;; I need to learn elisp then make this work!
  ;(setq jde-compiler '(("eclipse java compiler server" ((concat dotfiles-dir "/vendor/jdee/java/lib/ecj.jar")) )))
  (setq jde-compiler '(("eclipse java compiler server" "/Users/lstoll/.emacs.d/vendor/jdee/java/lib/ecj.jar" )))
  ;; Use this for troubleshooting flymake
  ;(setq flymake-log-level 3) 
  (push '(".+\\.java$" 
            ;jde-ecj-server-flymake-init ;; This is not working - looks like it's parsing the beanshell prompt:
            jde-ecj-flymake-init 
              jde-ecj-flymake-cleanup)
              flymake-allowed-file-name-masks)

  )
  ;; Auto start flymake
  (add-hook 'jde-mode-hook
               (lambda ()
                 (when (and buffer-file-name
                            (file-writable-p
                             (file-name-directory buffer-file-name))
                            (file-writable-p buffer-file-name))
                   (local-set-key (kbd "C-c d")
                                  'flymake-display-err-menu-for-current-line)
                   (flymake-mode t))))
  ;; Doesn't work..
  ;(setq jde-newline-function '(newline-and-indent))


(provide 'conf/jdee)
