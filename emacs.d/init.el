;;; init.el --- Pavel 'M4E5TR0' Matcula's GNU Emacs config.

;;; Commentary:

;;; Code:

(add-to-list 'custom-theme-load-path "~/0-linux/themes/")
(add-to-list 'custom-theme-load-path "~/1-linux/themes/")
(load-theme 'zenburn-by-m4e5tr0 :no-confirm)

(setq max-specpdl-size 2600)
(setq max-lisp-eval-depth 1200)
(load-file "~/1-linux/builds/cedet-bzr/cedet-devel-load.el")
(load-file "~/1-linux/builds/cedet-bzr/contrib/cedet-contrib-load.el")
(load-file (expand-file-name "init/pre-package/cedet.el" user-emacs-directory))

(load-file (expand-file-name "init/pre-package.el" user-emacs-directory))
(load-file (expand-file-name "init/package.el" user-emacs-directory))
(load-file (expand-file-name "init/post-package.el" user-emacs-directory))

(load-file (expand-file-name "init/post-package/diminish.el" user-emacs-directory))

(defconst backup-directory (expand-file-name "backups/" user-emacs-directory))
(make-directory backup-directory :parents)
(setq backup-directory-alist (list `("." . ,backup-directory)))
(setq tramp-backup-directory-alist (list `("." . ,backup-directory)))

(setq custom-file (expand-file-name "init-custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (with-temp-file custom-file nil))
(load custom-file)

;;; init.el ends here
