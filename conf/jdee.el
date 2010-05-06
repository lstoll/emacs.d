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
  )

;; jdee mode

(add-to-list 'load-path (concat dotfiles-dir "/vendor/jdee/lisp"))
(when (locate-library "jde")

  (autoload 'jde-mode "jde" "Java Development Environment for Emacs." t)
  (setq auto-mode-alist
        (cons '("\\.java\\'" . jde-mode) auto-mode-alist))

  ;(setq jde-web-browser "firefox")

  (add-hook 'jde-mode-hook 'jde-set-variables-init-value)

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
  (setq jde-compiler '("javac server" ""))

  )

(provide 'conf/jdee)
