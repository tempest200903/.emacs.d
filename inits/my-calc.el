;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-calc.el
;; #+LAST_UPDATED: 2012-06-27
;; ======================================================================
(defun my-calc-hour (arg)
  "region から 1.2 h 1.3 h 1.4 h を拾って合計する"
  (interactive "p")
  (if mark-active
      (outline-next-visible-heading 1)
    (outline-previous-visible-heading 1)
    (er/expand-region 3)
    )
  (let
      ((COMMAND "awk '/\\([0-9].* h/ { gsub(\"[^0-9.]+\", \"\", $0); SUM += $0 } END { print SUM }'"))
    ;; (shell-command-on-region START END COMMAND &optional OUTPUT-BUFFER REPLACE ERROR-BUFFER DISPLAY-ERROR-BUFFER)
    (shell-command-on-region (mark) (point) COMMAND)
    )
  (goto-last-change nil)
  )
