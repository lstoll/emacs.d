;; Listen on TCP
;(setq server-use-tcp t)
;(setq server-host "127.0.0.1")
;; Machine specific - start the server, blow away the socket if it errors and retry
(condition-case nil
  (server-start)
  ((error nil)
    (call-process "/bin/sh" nil nil nil "-c" "find /var/folders -name server 2>/dev/null | grep emacs501 | xargs rm")
    (server-start))
  )

; ctrl-x cmd-M is fullscreen
(global-set-key (kbd "C-x M-RET") 'ns-toggle-fullscreen)
;
; META is CMD - from http://www.emacswiki.org/emacs/MetaKeyProblems
;(setq mac-option-key-is-meta nil)
;(setq mac-command-key-is-meta t)
;(setq mac-command-modifier 'meta)
;(setq mac-option-modifier nil)

