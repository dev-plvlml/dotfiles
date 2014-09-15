(when (require 'diminish nil :noerror)
  (add-hook 'subword-mode-hook '(lambda () (diminish 'subword-mode)))
  (add-hook 'indent-guide-mode-hook '(lambda () (diminish 'indent-guide-mode)))
  (add-hook 'eldoc-mode-hook '(lambda () (diminish 'eldoc-mode))))
