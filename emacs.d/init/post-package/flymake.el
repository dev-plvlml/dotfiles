(when (require 'flymake nil :noerror)
  (add-hook 'find-file-hook 'flymake-find-file-hook)
  (add-to-list 'flymake-allowed-file-name-masks '("\\.[fF]\\(?:90\\|95\\|03\\|08\\)?\\'" flymake-simple-make-init))
  (add-to-list 'flymake-allowed-file-name-masks '("\\.f\\(?:or\\|pp\\|tn\\)\\'" flymake-simple-make-init))
  (add-to-list 'flymake-allowed-file-name-masks '("\\.F\\(?:OR\\|PP\\|TN\\)\\'" flymake-simple-make-init))
  (require 'rfringe nil :noerror))

(autoload 'flymake-lua-load "flymake-lua" nil :interactive)
(add-hook 'lua-mode-hook 'flymake-lua-load)

(autoload 'flymake-shell-load "flymake-shell" nil :interactive)
(add-hook 'sh-set-shell-hook 'flymake-shell-load)
