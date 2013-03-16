(require 'textmate)

(setq path-to-ctags "/opt/boxen/homebrew/bin/ctags")

;; Don't ask if we want to reload tags, just do it.
(setq tags-revert-without-query 1)

(defun create-tags (dir-name)
  "Create tags file"
  (interactive "Directory: ")
  (shell-command
   (format "%s --exclude=.bundle --exclude=cache --exclude=tmp --exclude=log -f %s/TAGS -e -R %s" path-to-ctags dir-name (directory-file-name dir-name))))

(defun create-project-tags ()
  "Create TAGS file for the current project (i.e the .hg/.gt level)"
  (interactive)
  (create-tags (textmate-project-root)))

(defun find-create-load-tags (&optional rebuild)
  "Builds and loads TAGS. Specify rebuild to force build even if exists"
  (interactive "Rebuild tags if existing?: ")
  (let* ((tag-dir (or (textmate-project-root) default-directory))
         (tag-file (concat tag-dir "TAGS")))

    (if (or rebuild (not (file-exists-p tag-file)))
      (create-tags tag-dir))
    (visit-tags-table tag-file)))

(defadvice find-tag (before c-tag-file activate)
  "Automatically create and load TAGS file for project."
  (find-create-load-tags))
