(defun my-find-org-hide-face () ; BUGFIX: for org-find-invisible-foreground
  (let ((candidates (remove
		     "unspecified-bg"
		     (nconc
		      (list (face-background 'default)
			    (face-background 'org-default))
		      (mapcar
		       (lambda (alist)
			 (when (boundp alist)
			   (cdr (assoc 'background-color (symbol-value alist)))))
		       '(default-frame-alist initial-frame-alist window-system-default-frame-alist))
		      (list (face-foreground 'org-hide))))))
    (car (last (remove nil candidates)))))
(advice-add 'org-find-invisible-foreground :override #'my-find-org-hide-face)
