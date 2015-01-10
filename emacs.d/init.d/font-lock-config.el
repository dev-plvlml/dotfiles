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

(defun my-add-label-face ()
  (font-lock-add-keywords
   nil
   '(("case" . 'font-lock-label-face)
     ("default:" . 'font-lock-label-face)
     ("public:" . 'font-lock-label-face)
     ("protected:" . 'font-lock-label-face)
     ("private:" . 'font-lock-label-face))))

(defun my-add-storage-class-face ()
  (font-lock-add-keywords
   nil
   '(("const" . 'font-lock-storage-class-face)
     ("volatile" . 'font-lock-storage-class-face)
     ("extern" . 'font-lock-storage-class-face)
     ("static" . 'font-lock-storage-class-face)
     ("register" . 'font-lock-storage-class-face)
     ("thread_local" . 'font-lock-storage-class-face))))
     
(defun my-add-structure-face ()
  (font-lock-add-keywords
   nil
   '(("struct" . 'font-lock-structure-face)
     ("union" . 'font-lock-structure-face)
     ("enum" . 'font-lock-structure-face)
     ("class" . 'font-lock-structure-face)
     ("template" . 'font-lock-structure-face)
     ("typename" . 'font-lock-structure-face))))

(add-hook 'c-mode-common-hook 'my-add-c-float-face) ; NOTE: order matters
(add-hook 'c-mode-common-hook 'my-add-c-number-face) ; NOTE: order matters
