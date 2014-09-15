(when (require 'yasnippet nil :noerror)
  (yas-global-mode 1)
  (add-to-list 'auto-mode-alist '("/snippets/" . snippet-mode))
  (add-hook 'yas-after-exit-snippet-hook
            '(lambda ()
               (indent-region yas-snippet-beg yas-snippet-end))))
