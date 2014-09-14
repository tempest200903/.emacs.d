;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-09-12
;; my-kill-ring-save.el
;; ======================================================================
;; * [2012-01-27 金] mark-active かそうでないかで2種類の動作をする。 
;; my-ffap-copy-string-as-kill.el と同様。
(defun my-kill-ring-save-or-ffap-copy-string-as-kill (&optional arg)
  "if mark-active then kill-ring-save else ffap-copy-string-as-kill."
  (interactive)
  (if mark-active
      (kill-ring-save (mark) (point))
    (ffap-copy-string-as-kill)))
;; 
(defun my-kill-buffer-file-name (&optional arg)
  "kill buffer-file-name. if arg is 4 then replace HOME to ~."
  (interactive "P")
  (let* (
         (b1 (buffer-file-name))
         (h1 (replace-regexp-in-string "\\\\" "/" (getenv "HOME")))
         (b2 (replace-regexp-in-string h1 "~" b1))
         )
    (cond
     (current-prefix-arg        (kill-new b2) (message b2))
     (t                         (kill-new b1) (message b1)))
    )
  )

;; ----------------------------------------------------------------------
(provide 'my-kill-ring-save) ;; goto my-autoload.el
;; ----------------------------------------------------------------------
