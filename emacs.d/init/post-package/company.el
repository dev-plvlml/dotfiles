(when (require 'company nil :noerror)
  (global-company-mode 1))

(when (require 'irony nil :noerror)
  (add-hook 'c-mode-hook 'irony-mode)
  (add-hook 'c++-mode-hook 'irony-mode)
  (add-hook 'objc-mode-hook 'irony-mode)
  (defun my-set-irony-mode-keys ()
    (define-key irony-mode-map [remap completion-at-point]
      'irony-completion-at-point-async)
    (define-key irony-mode-map [remap complete-symbol]
      'irony-completion-at-point-async))
  (add-hook 'irony-mode-hook 'my-set-irony-mode-keys)
  (defun my-add-company-backend-irony ()
    (add-to-list 'company-backends 'company-irony)
    (add-hook 'irony-mode-hook 'company-irony-setup-begin-commands))
  (eval-after-load 'company '(my-add-company-backend-irony)))
