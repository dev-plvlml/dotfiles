;; Use one of the default configs or...
;; (semantic-load-enable-minimum-features)
;; (semantic-load-enable-code-helpers)
;; (semantic-load-enable-gaudy-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)

;; ...or use the following config:
;; (setq semantic-default-submodes
;;       '(;; MINIMUM FEATURES
;;         global-semantic-idle-scheduler-mode
;;         global-semanticdb-minor-mode
;;         ;; CODE HELPERS
;;         global-semantic-idle-summary-mode
;;         ;; global-semantic-mru-bookmark-mode
;;         ;; global-cedet-m3-minor-mode
;;         ;; GAUDY CODE HELPERS
;;         ;; global-semantic-decoration-mode
;;         ;; global-semantic-stickyfunc-mode
;;         ;; global-semantic-idle-completions-mode
;;         ;; EXCESSIVE CODE HELPERS
;;         ;; global-semantic-highlight-func-mode
;;         global-semantic-idle-local-symbol-highlight-mode
;; 	))

;; (semantic-mode 1)

;; (setq semantic-idle-work-update-headers-flag t)
;; (setq semantic-idle-work-parse-neighboring-files-flag nil)

;; (semantic-toggle-decoration-style "semantic-decoration-on-includes" nil)
;; (semantic-toggle-decoration-style "semantic-decoration-on-protected-members" t)
;; (semantic-toggle-decoration-style "semantic-decoration-on-private-members" t)
;; (semantic-toggle-decoration-style "semantic-tag-boundary" nil)

;; (global-semantic-tag-folding-mode 1)
;; (global-semantic-idle-breadcrumbs-mode 1)

;; (require 'cedet-idutils nil :noerror)

;; (when (cedet-ectag-version-check :noerror)
;;   (semantic-load-enable-primary-ectags-support))

;; (when (require 'cedet-global nil :noerror)
;;   (when (cedet-gnu-global-version-check :noerror)
;;     (semanticdb-enable-gnu-global-databases 'c-mode)
;;     (semanticdb-enable-gnu-global-databases 'c++-mode)
;;     (semanticdb-enable-gnu-global-databases 'java-mode)
;;     (semanticdb-enable-gnu-global-databases 'php-mode)
;;     (semanticdb-enable-gnu-global-databases 'asm-mode)))

;; (when (require 'cedet-cscope nil :noerror)
;;   (when (cedet-cscope-version-check :noerror)
;;     (semanticdb-enable-cscope-databases)))

;; (semantic-clang-activate)

;; (global-ede-mode 1)
;; (defun my-load-ede-project-el ()
;;   (if (file-exists-p "Project.el")
;;     (load-file "Project.el")))
;; (add-hook 'find-file-hook 'my-load-ede-project-el)

;; (global-srecode-minor-mode 1)

(load-file (expand-file-name "init/pre-package/cedet-custom.el" user-emacs-directory))
