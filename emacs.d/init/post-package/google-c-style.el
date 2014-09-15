(autoload 'google-set-c-style "google-c-style" nil :interactive)
(add-hook 'c-mode-common-hook 'google-set-c-style)

;; Use google's default config...
(autoload 'google-make-newline-indent "google-c-style" nil :interactive)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; ...or use the following config:
;; (add-hook 'c-mode-common-hook
;;           '(lambda ()
;;              (define-key c-mode-base-map "\C-m" 'reindent-then-newline-and-indent)
;;              (define-key c-mode-base-map [ret] 'reindent-then-newline-and-indent)))
