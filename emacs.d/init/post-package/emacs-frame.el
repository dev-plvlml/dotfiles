(when (require 'tabbar nil :noerror)
  (tabbar-mode 1)
  (defun my-get-tab-label (tab)
    (concat " " (tabbar-buffer-tab-label tab) " "))
  (setq tabbar-tab-label-function 'my-get-tab-label))
