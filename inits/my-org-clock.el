;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-clock.el
;; ----------------------------------------------------------------------
;; http://hpcgi1.nifty.com/spen/index.cgi?OrgMode%2fManual1#i2
;; * [2010-11-01 月] 汎用的に使うので global-map
(defun my-org-clock-goto-u ()
  "alias of C-u M-x org-clock-goto"
  (interactive)
  (call-interactively 'set-mark-command)
  (org-clock-goto t)
  (call-interactively 'set-mark-command)
  )
;; "alias of C-u M-x my-org-clock-goto-u d C-l C-l
(fset 'my-org-clock-goto-default
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\347\365d" 0 "%d")) arg)))
;; ----------------------------------------------------------------------
(provide 'my-org-clock)
;; ----------------------------------------------------------------------
