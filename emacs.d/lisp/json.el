(defun yr-json-jq-format-buffer ()
  (interactive)
  (let ((begin (point-min))
	      (end (point-max)))
    (shell-command-on-region begin end "jq" (current-buffer) t)))
