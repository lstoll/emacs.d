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

;; Use default OS X Browser
(defun rcy-browse-url-default-macosx-browser (url &optional new-window)
    (interactive (browse-url-interactive-arg "URL: "))
      (let ((url
                 (if (aref (url-generic-parse-url url) 0)
                         url
                             (concat "http://" url))))
            (start-process (concat "open " url) nil "open" url)))
 
(setq browse-url-browser-function 'rcy-browse-url-default-macosx-browser)
