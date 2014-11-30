;; (ido-mode 1)
(when (icomplete-mode 1)
  (setq icomplete-prospects-height 2))
;; (load-file (expand-file-name "init/post-package/helm.el" user-emacs-directory)) ; TODO
;; (load-file (expand-file-name "init/post-package/icicles.el" user-emacs-directory)) ; TODO

(when (require 'c-eldoc nil :noerror)
  (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode))
