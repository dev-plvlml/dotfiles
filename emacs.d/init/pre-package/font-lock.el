(defface font-lock-float-face
  '((default :inherit font-lock-constant-face))
  "A face for highlighting floating point number literals.")

(defface font-lock-number-face
  '((default :inherit font-lock-constant-face))
  "A face for highlighting integer number literals.")

(defun my-add-c-float-face ()
  (font-lock-add-keywords
   nil
   '(("\\B\\.[0-9]+\\(?:[eE][-+]?[0-9]+\\)?[fFlL]?\\>" . 'font-lock-float-face)
     ("\\<[0-9]+\\.[0-9]*\\(?:[eE][-+]?[0-9]+\\)?[fFlL]?\\>" . 'font-lock-float-face)
     ("\\<[0-9]+\\.\\B" . 'font-lock-float-face)
     ("\\<[0-9]+[eE][-+]?[0-9]+[fFlL]?\\>" . 'font-lock-float-face))))

(defun my-add-c-number-face ()
  (font-lock-add-keywords
   nil
   '(("\\<[1-9][0-9]*\\(?:[uU]\\(?:l\\|L\\|ll\\|LL\\)?\\|\\(?:l\\|L\\|ll\\|LL\\)[uU]?\\)?\\>" . 'font-lock-number-face)
     ("\\<0[xX][0-9a-fA-F]+\\(?:[uU]\\(?:l\\|L\\|ll\\|LL\\)?\\|\\(?:l\\|L\\|ll\\|LL\\)[uU]?\\)?\\>" . 'font-lock-number-face)
     ("\\<0[bB][0-1]+\\(?:[uU]\\(?:l\\|L\\|ll\\|LL\\)?\\|\\(?:l\\|L\\|ll\\|LL\\)[uU]?\\)?\\>" . 'font-lock-number-face)
     ("\\<0[0-7]*\\(?:[uU]\\(?:l\\|L\\|ll\\|LL\\)?\\|\\(?:l\\|L\\|ll\\|LL\\)[uU]?\\)?\\>" . 'font-lock-number-face))))
     
(add-hook 'c-mode-common-hook 'my-add-c-float-face) ; NOTE: don't change order
(add-hook 'c-mode-common-hook 'my-add-c-number-face) ; NOTE: don't change order
