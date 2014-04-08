;;; package --- M4E5TR0's Emacs config.

;;; Commentary:

;;; Code:

(setq max-specpdl-size 2600)		; original value was 1300
(setq max-lisp-eval-depth 1200)		; original value was 600

(menu-bar-mode -1)
(tool-bar-mode -1)
;; (scroll-bar-mode -1)   ; if emacs is compiled with toolkit scroll bars
(set-scroll-bar-mode 'right) ; if emacs is compiled without toolkit scroll bars
(tooltip-mode -1)

(add-to-list 'custom-theme-load-path "~/0-linux/themes/")
(add-to-list 'custom-theme-load-path "~/1-linux/themes/")
(load-theme 'zenburn-by-m4e5tr0 t)

(global-linum-mode 1)
(global-hl-line-mode 1)
(blink-cursor-mode -1)
(column-number-mode 1)
(show-paren-mode 1)
(global-subword-mode 1)

(load-file "~/1-linux/builds/cedet-bzr/cedet-devel-load.el")
(load-file "~/1-linux/builds/cedet-bzr/contrib/cedet-contrib-load.el")

;; Use one of the default configs or...
;; (semantic-load-enable-minimum-features)
;; (semantic-load-enable-code-helpers)
;; (semantic-load-enable-gaudy-code-helpers)
;; (semantic-load-enable-excessive-code-helpers)

;; ...or use m4e5tr0's config
(setq
 semantic-default-submodes
 '(
   ;; MINIMUM FEATURES
   global-semantic-idle-scheduler-mode
   global-semanticdb-minor-mode
   ;; CODE HELPERS
   global-semantic-idle-summary-mode
   ;; global-semantic-mru-bookmark-mode
   ;; global-cedet-m3-minor-mode
   ;; GAUDY CODE HELPERS
   ;; global-semantic-decoration-mode
   ;; global-semantic-stickyfunc-mode
   ;; global-semantic-idle-completions-mode
   ;; EXCESSIVE CODE HELPERS
   ;; global-semantic-highlight-func-mode
   global-semantic-idle-local-symbol-highlight-mode
   ))

(semantic-mode 1)

(setq semantic-idle-work-update-headers-flag t)
(setq semantic-idle-work-parse-neighboring-files-flag nil)

;; (semantic-toggle-decoration-style "semantic-decoration-on-includes" nil)
;; (semantic-toggle-decoration-style "semantic-decoration-on-protected-members" t)
;; (semantic-toggle-decoration-style "semantic-decoration-on-private-members" t)
;; (semantic-toggle-decoration-style "semantic-tag-boundary" nil)

;; (global-semantic-tag-folding-mode 1)
;; (global-semantic-idle-breadcrumbs-mode 1)

(require 'cedet-idutils nil :noerror)

(when (cedet-ectag-version-check :noerror)
  (semantic-load-enable-primary-ectags-support))

(when (require 'cedet-global nil :noerror)
  (when (cedet-gnu-global-version-check :noerror)
    (semanticdb-enable-gnu-global-databases 'c-mode)
    (semanticdb-enable-gnu-global-databases 'c++-mode)
    (semanticdb-enable-gnu-global-databases 'java-mode)
    (semanticdb-enable-gnu-global-databases 'php-mode)
    (semanticdb-enable-gnu-global-databases 'asm-mode)))

(when (require 'cedet-cscope nil :noerror)
  (when (cedet-cscope-version-check :noerror)
    (semanticdb-enable-cscope-databases)))

;; (semantic-clang-activate)

(global-srecode-minor-mode 1)

(global-ede-mode 1)
(ede-enable-generic-projects)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") :append)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") :append)
(package-initialize)
(setq package-enable-at-startup nil)

;; (when (require 'tabbar nil :noerror)
;;   (tabbar-mode 1))

(when (require 'hlinum nil :noerror)
  (hlinum-activate))

;; (require 'highlight-indentation nil :noerror)

(when (require 'indent-guide nil :noerror)
  (indent-guide-global-mode 1)
  (add-to-list 'indent-guide-inhibit-modes 'package-menu-mode))

;; (ido-mode 1)

;; (icomplete-mode 1)
;; (eval-after-load "icomplete" '(progn (require 'icomplete+ nil :noerror)))

;; (electric-pair-mode 1)

;; (when (require 'smartparens-config nil :noerror)
;;   (smartparens-global-mode 1))

(when (require 'autopair nil :noerror)
  (autopair-global-mode 1))

;; (when (require 'flycheck nil :noerror)
;;   (global-flycheck-mode 1)
;;   (setq-default flycheck-clang-language-standard "c++11"))

(when (require 'flymake nil :noerror)
  ;; (require 'flymake-cursor nil :noerror)
  (add-hook 'find-file-hook 'flymake-find-file-hook)
  (add-to-list 'flymake-allowed-file-name-masks '("\\.[fF]\\(?:90\\|95\\|03\\|08\\)?\\'" flymake-simple-make-init))
  (add-to-list 'flymake-allowed-file-name-masks '("\\.f\\(?:or\\|pp\\|tn\\)\\'" flymake-simple-make-init))
  (add-to-list 'flymake-allowed-file-name-masks '("\\.F\\(?:OR\\|PP\\|TN\\)\\'" flymake-simple-make-init)))

(autoload 'flymake-lua-load "flymake-lua" nil t)
(add-hook 'lua-mode-hook 'flymake-lua-load)

(autoload 'flymake-shell-load "flymake-shell" nil t)
(add-hook 'sh-set-shell-hook 'flymake-shell-load)

(require 'rfringe nil :noerror)

(when (require 'yasnippet nil :noerror)
  (yas-global-mode 1)
  (add-to-list 'auto-mode-alist '("/snippets/" . snippet-mode))
  (add-hook
   'yas-after-exit-snippet-hook
   '(lambda ()
      (indent-region yas-snippet-beg yas-snippet-end))))

;; (when (require 'company nil :noerror)
;;   (global-company-mode 1))

(require 'auto-complete-config nil :noerror)

;; Use the default config or...
;; (when (featurep 'auto-complete)
;;   (ac-config-default)
;;   (ac-flyspell-workaround))

;; ...or use m4e5tr0's config
(when (featurep 'auto-complete)
  (setq-default ac-sources '(ac-source-yasnippet ac-source-filename))
  (add-hook 'emacs-lisp-mode-hook 'my-add-ac-source-emacs-lisp) ; original function uses yasnippet
  (add-hook 'ruby-mode-hook 'ac-ruby-mode-setup)
  (add-hook 'css-mode-hook 'ac-css-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode 1)
  (ac-flyspell-workaround))

(defun my-add-ac-source-emacs-lisp ()
  (setq ac-sources (append '(ac-source-features ac-source-functions ac-source-variables ac-source-symbols) ac-sources)))

(defun my-add-ac-source-semantic ()
  (setq ac-sources (append '(ac-source-semantic ac-source-semantic-raw) ac-sources)))
;; (add-hook 'c-mode-common-hook 'my-add-ac-source-semantic)

(defun my-add-ac-source-gtags ()
  (setq ac-sources (append '(ac-source-gtags) ac-sources)))
;; (add-hook 'c-mode-common-hook 'my-add-ac-source-gtags)

(require 'auto-complete-clang-async nil :noerror)
(defun my-add-ac-source-clang-async ()
  (setq ac-sources (append '(ac-source-clang-async) ac-sources))
  (ac-clang-launch-completion-process))
(add-hook 'c-mode-hook 'my-add-ac-source-clang-async)
(add-hook 'c++-mode-hook 'my-add-ac-source-clang-async)
(add-hook 'objc-mode-hook 'my-add-ac-source-clang-async)

; NOTE: set ac-clang-cflags in .dir_locals.el

(when (require 'auto-complete-c-headers nil :noerror)
  (add-to-list 'achead:include-directories "/usr/include/c++/4.8.2" :append) ; TODO
  (add-to-list 'achead:include-directories "/usr/include/c++/4.8.2/backward" :append)) ; TODO
(defun my-add-ac-source-c-headers ()
  (add-to-list 'ac-sources 'ac-source-c-headers))
(add-hook 'c-mode-hook 'my-add-ac-source-c-headers)
(add-hook 'c++-mode-hook 'my-add-ac-source-c-headers)

(defvar my-achead-include-directories '()) ; NOTE: set in .dir_locals.el
(defun my-get-achead-include-directories ()
  (append achead:include-directories my-achead-include-directories))
(setq achead:get-include-directories-function 'my-get-achead-include-directories)

;; (eval-after-load "eldoc" '(progn (require 'eldoc-extension nil :noerror)))
(add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
(add-hook 'lisp-interaction-mode-hook 'eldoc-mode)

(autoload 'lua-mode "lua-mode" nil :interactive)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(autoload 'pkgbuild-mode "pkgbuild-mode" nil :interactive)
(add-to-list 'auto-mode-alist '("/PKGBUILD$" . pkgbuild-mode))

(autoload 'muttrc-mode "muttrc-mode" nil :interactive)
(add-to-list 'auto-mode-alist '("muttrc\\'" . muttrc-mode))

(add-to-list 'auto-mode-alist '("\\.[fF]\\(?:90\\|95\\|03\\|08\\)\\'" . fortran-mode))
(add-to-list 'auto-mode-alist '("\\.f\\(?:or\\|pp\\|tn\\|i\\)\\'" . fortran-mode))
(add-to-list 'auto-mode-alist '("\\.F\\(?:OR\\|PP\\|TN\\)\\'" . fortran-mode))

(autoload 'dummy-h-mode "dummy-h-mode" nil :interactive)
(add-to-list 'auto-mode-alist '("\\.h$" . dummy-h-mode))

(autoload 'google-set-c-style "google-c-style" nil :interactive)
(add-hook 'c-mode-common-hook 'google-set-c-style)

;; Use google's config for newline-and-indent...
;; (autoload 'google-make-newline-indent "google-c-style" nil :interactive)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; ...or use m4e5tr0's config for reindent-then-newline-and-indent
(add-hook
 'c-mode-common-hook
 '(lambda ()
    (define-key c-mode-base-map "\C-m" 'reindent-then-newline-and-indent)
    (define-key c-mode-base-map [ret] 'reindent-then-newline-and-indent)))

(defface font-lock-float-face
  '((default :inherit default))
  "A face for highlighting floating point number literals.")

(defface font-lock-number-face
  '((default :inherit default))
  "A face for highlighting integer number literals.")

(defun my-add-c-float-face ()
  (font-lock-add-keywords
   nil
   '(("\\<\\(?:[0-9]+\\.[0-9]*\\|\\.[0-9]+\\)\\(?:[eE][-+]?[0-9]+\\)?[fFlL]?\\>" . 'font-lock-float-face)
     ("\\<[0-9]+[eE][-+]?[0-9]+[fFlL]?\\>" . 'font-lock-float-face))))

(defun my-add-c-number-face ()
  (font-lock-add-keywords
   nil
   '(("\\<[1-9][0-9]*\\(?:[uU]\\(?:l\\|L\\|ll\\|LL\\)?\\|\\(?:l\\|L\\|ll\\|LL\\)[uU]?\\)?\\>" . 'font-lock-number-face)
     ("\\<0[0-7]*\\(?:[uU]\\(?:l\\|L\\|ll\\|LL\\)?\\|\\(?:l\\|L\\|ll\\|LL\\)[uU]?\\)?\\>" . 'font-lock-number-face)
     ("\\<0[bB][0-1]+\\(?:[uU]\\(?:l\\|L\\|ll\\|LL\\)?\\|\\(?:l\\|L\\|ll\\|LL\\)[uU]?\\)?\\>" . 'font-lock-number-face)
     ("\\<0[xX][0-9a-fA-F]+\\(?:[uU]\\(?:l\\|L\\|ll\\|LL\\)?\\|\\(?:l\\|L\\|ll\\|LL\\)[uU]?\\)?\\>" . 'font-lock-number-face))))

(add-hook 'c-mode-common-hook 'my-add-c-float-face)
(add-hook 'c-mode-common-hook 'my-add-c-number-face)

(defvar semantic-lex-c-preprocessor-symbol-file '())
(add-to-list 'semantic-lex-c-preprocessor-symbol-file '"/usr/local/include/mgl2/define.h")
(add-to-list 'semantic-lex-c-preprocessor-symbol-file '"/usr/local/include/mgl2/config.h")
(add-to-list 'semantic-lex-c-preprocessor-symbol-file '"/usr/local/include/mgl2/dllexport.h")

(when (require 'diminish nil :noerror)
  (diminish 'indent-guide-mode)
  (add-hook 'eldoc-mode-hook '(lambda () (diminish 'eldoc-mode))))

;; (defconst backup-directory (expand-file-name "backups" user-emacs-directory))
;; (setq backup-directory-alist (list `("." . ,backup-directory)))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;;; .emacs ends here
