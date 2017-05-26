(defun my-add-c-float-face ()
  (font-lock-add-keywords
   nil
   '(("\\B\\.[0-9]+\\(?:[eE][-+]?[0-9]+\\)?[fFlL]?\\>" . 'hl-like-vim-float)
     ("\\<[0-9]+\\.[0-9]*\\(?:[eE][-+]?[0-9]+\\)?[fFlL]?\\>" . 'hl-like-vim-float)
     ("\\<[0-9]+\\.\\B" . 'hl-like-vim-float)
     ("\\<[0-9]+[eE][-+]?[0-9]+[fFlL]?\\>" . 'hl-like-vim-float))))

(defun my-add-c-number-face ()
  (font-lock-add-keywords
   nil
   '(("\\<[1-9][0-9]*\\(?:[uU]\\(?:l\\|L\\|ll\\|LL\\)?\\|\\(?:l\\|L\\|ll\\|LL\\)[uU]?\\)?\\>" . 'hl-like-vim-number)
     ("\\<0[xX][0-9a-fA-F]+\\(?:[uU]\\(?:l\\|L\\|ll\\|LL\\)?\\|\\(?:l\\|L\\|ll\\|LL\\)[uU]?\\)?\\>" . 'hl-like-vim-number)
     ("\\<0[bB][0-1]+\\(?:[uU]\\(?:l\\|L\\|ll\\|LL\\)?\\|\\(?:l\\|L\\|ll\\|LL\\)[uU]?\\)?\\>" . 'hl-like-vim-number)
     ("\\<0[0-7]*\\(?:[uU]\\(?:l\\|L\\|ll\\|LL\\)?\\|\\(?:l\\|L\\|ll\\|LL\\)[uU]?\\)?\\>" . 'hl-like-vim-number))))

;; (add-to-list 'c++-font-lock-extra-types "auto")

(add-hook 'c-mode-common-hook 'my-add-c-float-face) ; NOTE: order matters
(add-hook 'c-mode-common-hook 'my-add-c-number-face) ; NOTE: order matters
