;;; Major modes

(setq inhibit-startup-screen t)

(add-to-list 'auto-mode-alist '("\\.[fF]\\(?:90\\|95\\|03\\|08\\)\\'" . fortran-mode))
(add-to-list 'auto-mode-alist '("\\.f\\(?:or\\|pp\\|tn\\|i\\)\\'" . fortran-mode))
(add-to-list 'auto-mode-alist '("\\.F\\(?:OR\\|PP\\|TN\\)\\'" . fortran-mode))

;;; Minor modes

(load-file (expand-file-name "init/pre-package/font-lock.el" user-emacs-directory))
(show-paren-mode 1)
(global-subword-mode 1)
