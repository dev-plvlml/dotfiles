(when (require 'smartparens-config nil :noerror)
  (smartparens-global-mode 1)
  (defun my-put-newline-in-braces (&rest ignore)
    (newline)
    (indent-according-to-mode)
    (forward-line -1)
    (indent-according-to-mode))
  (sp-local-pair 'c++-mode "{" nil :post-handlers '((my-put-newline-in-braces "RET")))
  (sp-local-pair 'c-mode "{" nil :post-handlers '((my-put-newline-in-braces "RET"))))
