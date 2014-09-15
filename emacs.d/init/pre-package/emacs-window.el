;; (scroll-bar-mode -1) ; FIXME: check if emacs is compiled with toolkit scroll bars
(set-scroll-bar-mode 'right) ; FIXME: check if emacs is compiled without toolkit scroll bars

(global-linum-mode 1)
; (global-hl-line-mode 1) ; FIXME: should recenter on scrolling, not scroll conservatively

(setq-default cursor-type 'bar)
(setq blink-cursor-delay 60) ; NOTE: don't change order
(setq blink-cursor-blinks 0) ; NOTE: don't change order
(blink-cursor-mode 1) ; NOTE: don't change order
(add-hook 'overwrite-mode-hook
          '(lambda ()
             (if overwrite-mode
                 (setq cursor-type 'box)
               (setq cursor-type 'bar))))

(column-number-mode 1)
