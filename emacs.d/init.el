;;; init.el --- Pavel 'M4E5TR0' Matcula's GNU Emacs config.

;;; Commentary:

;;; Code:

(message "Loading M4E5TR0's GNU Emacs config...")

(setq user-full-name "Pavel Matcula")
;; (setq user-mail-address nil) ; NOTE: anti-spam -> personal

(defvar user-theme 'zenburn-care)
(defvar user-theme-load-path nil) ; NOTE: platform-specific -> personal
(defvar custom-cedet-directory nil) ; NOTE: platform-specific -> personal

(defun my-load-personal-file (file)
  (load (expand-file-name file (expand-file-name "personal" user-emacs-directory)) :noerror))
(my-load-personal-file "config.el")

(when custom-cedet-directory
  (setq max-specpdl-size 2600)
  (setq max-lisp-eval-depth 1200)
  (load-file (expand-file-name "cedet-devel-load.el" custom-cedet-directory))
  (load-file (expand-file-name "cedet-contrib-load.el" (expand-file-name "contrib" custom-cedet-directory))))

(require 'package)
;; (add-to-list 'package-archives '("elpa" . "http://tromey.com/elpa/") :append)
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") :append)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") :append)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") :append)
(message "Initializing packages...")
(package-initialize)
(message "Initializing packages... DONE.")
(setq package-enable-at-startup nil)

(when user-theme
  (when user-theme-load-path
    (add-to-list 'custom-theme-load-path user-theme-load-path))
  (load-theme user-theme :no-confirm))

(unless (package-installed-p 'req-package)
  (message "Installing req-package...")
  (package-install 'req-package)
  (message "Installing req-package... DONE."))
(require 'req-package)

(use-package org-install
  :ensure org-plus-contrib)
(org-babel-load-file (expand-file-name "init-config.org" user-emacs-directory))
(message "Requiring packages...")
(req-package-finish)
(message "Requiring packages... DONE.")

(defconst backup-directory (expand-file-name "backups" user-emacs-directory))
(make-directory backup-directory :parents)
(setq backup-directory-alist (list `(".*" . ,backup-directory)))

(defconst auto-save-directory (expand-file-name "auto-save-list" user-emacs-directory))
(make-directory auto-save-directory :parents)
(setq auto-save-file-name-transforms (list `(".*" ,auto-save-directory :uniquify)))

(setq custom-file (expand-file-name "init-custom.el" user-emacs-directory))
(unless (file-exists-p custom-file)
  (with-temp-file custom-file nil))
(load custom-file)

(message "Loading M4E5TR0's GNU Emacs config... DONE.")

;;; init.el ends here
