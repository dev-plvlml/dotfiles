(require 'auto-complete-config nil :noerror)

;; Use the default config or...
;; (when (featurep 'auto-complete)
;;   (ac-config-default))

;; ...or use the following config:
(when (featurep 'auto-complete)
  (setq-default ac-sources '(ac-source-yasnippet ac-source-filename))
  (add-hook 'emacs-lisp-mode-hook 'my-add-ac-source-emacs-lisp)
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode 1))

(when (featurep 'auto-complete)
  (defun my-add-ac-source-emacs-lisp ()
    (setq-local ac-sources (append '(ac-source-features ac-source-functions ac-source-variables ac-source-symbols) ac-sources)))
  (defun my-add-ac-source-semantic ()
    (interactive)
    (setq-local ac-sources (append '(ac-source-semantic ac-source-semantic-raw) ac-sources)))
  (defun my-add-ac-source-gtags ()
    (interactive)
    (setq-local ac-sources (append '(ac-source-gtags) ac-sources)))
  (ac-flyspell-workaround)
  (ac-linum-workaround))

(when (require 'auto-complete-clang-async nil :noerror)
  (defun my-add-ac-source-clang-async ()
    (setq-local ac-sources (append '(ac-source-clang-async) ac-sources))
    (ac-clang-launch-completion-process)) ; BUG: hides c-electric-...
  (add-hook 'c-mode-hook 'my-add-ac-source-clang-async)
  (defvar cxxflags '()) ; NOTE: set in .dir-locals.el
  (defvar cxxflags-default '("-std=c++11"))
  (add-hook 'c++-mode-hook
            '(lambda ()
               (setq-local ac-clang-cflags cxxflags-default) ; TODO: ac-clang-set-cflags
               (my-add-ac-source-clang-async)))
  (defun my-set-ac-clang-cflags ()
    (interactive)
    (setq-local ac-clang-cflags '(append cxxflags-default cxxflags))
    (ac-clang-update-cmdlineargs)))

(when (require 'auto-complete-c-headers nil :noerror)
  (defun my-add-ac-source-c-headers ()
    (setq-local ac-sources (append ac-sources '(ac-source-c-headers))))
  (add-hook 'c-mode-hook 'my-add-ac-source-c-headers)
  (add-hook 'c++-mode-hook 'my-add-ac-source-c-headers)
  (setq-mode-local c++-mode achead:include-directories
                   (append achead:include-directories
                           '("/usr/include/c++/4.9.2/" ; NOTE: change on update
                             "/usr/include/c++/4.9.2/backward/"))) ; NOTE: change on update
  (defvar include-dirs '()) ; NOTE: set in .dir-locals.el
  (defun my-get-achead-include-dirs ()
    (append achead:include-directories include-dirs))
  (setq achead:get-include-directories-function 'my-get-achead-include-dirs))
