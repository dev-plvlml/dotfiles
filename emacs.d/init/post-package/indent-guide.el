(when (require 'indent-guide nil :noerror)
  (unless (daemonp) ; BUG: crashes Emacs daemon
    (indent-guide-global-mode 1))
  (add-to-list 'indent-guide-inhibit-modes 'package-menu-mode))
