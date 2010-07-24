;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Basic module support code underlying all chess.el modules
;;

(require 'chess-game)

(defvar chess-module-game nil)
(defvar chess-module-event-handler nil)
(defvar chess-module-leader nil)

(make-variable-buffer-local 'chess-module-game)
(make-variable-buffer-local 'chess-module-event-handler)
(make-variable-buffer-local 'chess-module-leader)

(chess-message-catalog 'english
  '((no-such-module . "There is no module named '%s'")))

(defmacro chess-with-current-buffer (buffer &rest body)
  `(let ((buf ,buffer))
     (if buf
	 (with-current-buffer buf
	   ,@body)
       ,@body)))

(defun chess-module-create (derived game &optional buffer-name
				    &rest ctor-args)
  (let* ((name (symbol-name derived))
	 handler buffer)
    (unless (and (require derived nil t)
		 (setq handler (intern-soft (concat name "-handler"))))
      (chess-error 'no-such-module name))
    (with-current-buffer (generate-new-buffer (or buffer-name
						  (format " *%s*" name)))
      (if (not (apply handler game 'initialize ctor-args))
	  (ignore
	   (kill-buffer (current-buffer)))
	(add-hook 'kill-buffer-hook 'chess-module-destroy nil t)
	(setq chess-module-event-handler handler)
	(chess-module-set-game* nil game)
	(current-buffer)))))

(defun chess-module-game (module)
  (chess-with-current-buffer module
    chess-module-game))

(defun chess-module-game-index (module)
  (chess-with-current-buffer module
    (chess-game-index chess-module-game)))

(defun chess-module-detach-game (module)
  (chess-with-current-buffer module
    (chess-game-remove-hook chess-module-game
			    'chess-module-event-handler
			    (or module (current-buffer)))
    ;; if we are the leader, shutdown the game we were attached to
    ;; previously
    (if chess-module-leader
	(chess-game-run-hooks chess-module-game 'destroy))))

(defun chess-module-set-game (module game &optional no-setup)
  (chess-with-current-buffer module
    (let ((chess-game-inhibit-events no-setup))
      (chess-game-copy-game chess-module-game game))))

(defun chess-module-set-game* (module game)
  (chess-with-current-buffer module
    (assert game)
    (if chess-module-game
	(chess-module-detach-game nil))
    (setq chess-module-game game)
    (chess-game-add-hook game 'chess-module-event-handler
			 (or module (current-buffer)))))

(defsubst chess-module-leader-p (module)
  (chess-with-current-buffer module
    chess-module-leader))

(defsubst chess-module-set-leader (module)
  (chess-with-current-buffer module
    (setq chess-module-leader t)))

(defsubst chess-module-clear-leader (module)
  (chess-with-current-buffer module
    (setq chess-module-leader nil)))

(defun chess-module-destroy (&optional module)
  (let ((buf (or module (current-buffer))))
    (when (buffer-live-p buf)
      (with-current-buffer buf
	(remove-hook 'kill-buffer-hook 'chess-module-destroy t)
	(chess-module-detach-game nil))
      (kill-buffer buf))))

(defun chess-module-event-handler (game object event &rest args)
  (with-current-buffer object
    (apply chess-module-event-handler game event args)
    (if (eq event 'destroy)
	(chess-module-destroy nil))))

(provide 'chess-module)

;;; chess-module.el ends here
