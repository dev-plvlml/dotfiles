;;; init.el --- Pavel "M4E5TR0" Matcula's GNU Emacs config.

;;; Commentary:

;;; Code:

(message "Loading M4E5TR0's GNU Emacs config...")

(setq user-full-name "Pavel Matcula")
(let ((dot ".") (at "@") (google-mail "gmail.com"))
  (setq user-mail-address (concat "dev" dot "plvlml" at google-mail)))

(defvar user-theme 'zenburn-care)
(defvar user-theme-load-path "~/1-linux/themes/zenburn-care")
(defvar custom-cedet-directory nil) ;; "~/0-linux/builds/cedet.git")
(defvar custom-reveal.js-root "file:///home/m4e5tr0/0-linux/scripts/reveal-js.git")

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

(package-initialize :no-activate)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'org-plus-contrib)
  (message "Installing org-plus-contrib...")
  (package-install 'org-plus-contrib)
  (message "Installing org-plus-contrib...done"))

(unless (package-installed-p 'req-package)
  (message "Installing req-package...")
  (package-install 'req-package)
  (message "Installing req-package...done"))

(message "Initializing packages...")
(package-initialize)
(message "Initializing packages...done")
(setq package-enable-at-startup nil)

(when user-theme-load-path
  (add-to-list 'custom-theme-load-path user-theme-load-path))
(when user-theme
  (load-theme user-theme :no-confirm))

(require 'org)
(load-file (expand-file-name "org-config.el" (expand-file-name "init.d" user-emacs-directory)))

(require 'req-package)
(org-babel-load-file (expand-file-name "init-config.org" user-emacs-directory))
(message "Requiring packages...")
(req-package-finish)
(message "Requiring packages...done")

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

(message "Loading M4E5TR0's GNU Emacs config...done")

;; (require 'exwm)
;; (require 'exwm-config)
;; (exwm-config-default)

;;; init.el ends here
