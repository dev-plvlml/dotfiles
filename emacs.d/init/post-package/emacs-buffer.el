;;; Major modes

(autoload 'cmake-mode "cmake-mode" nil :interactive)
(add-to-list 'auto-mode-alist '("CMakeLists\\.txt\\'" . cmake-mode))
(add-to-list 'auto-mode-alist '("\\.cmake\\'" . cmake-mode))

(autoload 'dummy-h-mode "dummy-h-mode" nil :interactive)
(add-to-list 'auto-mode-alist '("\\.h$" . dummy-h-mode))

(autoload 'lua-mode "lua-mode" nil :interactive)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(autoload 'pkgbuild-mode "pkgbuild-mode" nil :interactive)
(add-to-list 'auto-mode-alist '("/PKGBUILD$" . pkgbuild-mode))

(autoload 'muttrc-mode "muttrc-mode" nil :interactive)
(add-to-list 'auto-mode-alist '("muttrc\\'" . muttrc-mode))

(autoload 'markdown-mode "markdown-mode" nil :interactive)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;;; Minor modes

(electric-pair-mode 1)
;; (load-file (expand-file-name "init/post-package/autopair.el" user-emacs-directory))
;; (load-file (expand-file-name "init/post-package/smartparens.el" user-emacs-directory))

(load-file (expand-file-name "init/post-package/google-c-style.el" user-emacs-directory))

(load-file (expand-file-name "init/post-package/doxymacs.el" user-emacs-directory))

(load-file (expand-file-name "init/post-package/indent-guide.el" user-emacs-directory))

(load-file (expand-file-name "init/post-package/yasnippet.el" user-emacs-directory))

;; (load-file (expand-file-name "init/post-package/auto-complete.el" user-emacs-directory))
(load-file (expand-file-name "init/post-package/company.el" user-emacs-directory))

;; (load-file (expand-file-name "init/post-package/flymake.el" user-emacs-directory))
(load-file (expand-file-name "init/post-package/flycheck.el" user-emacs-directory))
