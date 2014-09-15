(when (require 'flycheck nil :noerror)
  (global-flycheck-mode 1)
  (setq-mode-local c++-mode flycheck-clang-language-standard "c++11"))
