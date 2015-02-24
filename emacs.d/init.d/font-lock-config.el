(defface font-lock-float-face
  '((default :inherit font-lock-constant-face))
  "A face for highlighting floating point number literals.")

(defface font-lock-number-face
  '((default :inherit font-lock-constant-face))
  "A face for highlighting integer number literals.")

(defface font-lock-label-face
  '((default:inherit font-lock-constant-face))
  "A face for highlighting labels.")

(defface font-lock-storage-class-face
  '((default  :inherit font-lock-keyword-face))
  "A face for highlighting storage class specifiers.")

(defface font-lock-structure-face
  '((default :inherit font-lock-keyword-face))
  "A face for highlighting structure keywords.")

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

(defun my-add-c-label-face ()
  (font-lock-add-keywords
   nil
   '(("\\<case\\>" . 'font-lock-label-face)
     ("\\<\\(default\\)[[:space:]]*:" 1 'font-lock-label-face))))
(add-hook 'c-mode-common-hook 'my-add-c-label-face)

(font-lock-add-keywords
 'c++-mode
 '(("\\<\\(p\\(?:r\\(?:ivate\\|otected\\)\\|ublic\\)\\)[[:space:]]*:" 1 'font-lock-label-face)))

(font-lock-add-keywords
 'c++-mode
 '(("\\<auto\\>" . 'font-lock-type-face)
   ("\\<\\([[:alpha:]_][[:alnum:]_]+\\)[[:space:]]*::" 1 'font-lock-type-face)))

(defun my-add-c-storage-class-face ()
  (font-lock-add-keywords
   nil
   '(("\\<\\(?:const\\|extern\\|register\\|static\\|thread_local\\|volatile\\)\\>" . 'font-lock-storage-class-face))))
(add-hook 'c-mode-common-hook 'my-add-c-storage-class-face)
     
(defun my-add-c-structure-face ()
  (font-lock-add-keywords
   nil
   '(("\\<\\(?:class\\|enum\\|struct\\|t\\(?:emplate|ypename\\)\\|union\\)\\>" . 'font-lock-structure-face))))
(add-hook 'c-mode-common-hook 'my-add-c-structure-face)

(add-hook 'c-mode-common-hook 'my-add-c-float-face) ; NOTE: order matters
(add-hook 'c-mode-common-hook 'my-add-c-number-face) ; NOTE: order matters
