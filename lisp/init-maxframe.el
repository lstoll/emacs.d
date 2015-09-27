(require-package 'maxframe)

(add-hook 'window-setup-hook 'maximize-frame t)

;;(mf-display-padding-height 46 nil nil
;;       "The default value of 45 leaves the titlebar tucked up under"
;;      " the menu bar on OSX Lion"
;;       " See http://debbugs.gnu.org/cgi/bugreport.cgi?bug=10449")


(setq mf-max-width 1600)

(provide 'init-maxframe)
