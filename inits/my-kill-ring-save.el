;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-09-12
;; my-kill-ring-save.el
;; ======================================================================
;; * [2012-01-27 金] mark-active かそうでないかで2種類の動作をする。 my-ffap-copy-string-as-kill.el と同様。
(defun my-kill-ring-save-or-ffap-copy-string-as-kill (&optional arg)
  "kill-ring-save or ffap-copy-string-as-kill"
  (interactive)
  (if mark-active
      (kill-ring-save (mark) (point))
    (ffap-copy-string-as-kill)))
(defun my-kill-buffer-file-name (&optional arg)
  "kill buffer-file-name"
  (interactive)
  (kill-new (buffer-file-name))
  (message (buffer-file-name))
  )
;; ----------------------------------------------------------------------
(global-set-key (kbd "M-w") 'my-kill-ring-save-or-ffap-copy-string-as-kill)
(global-set-key (kbd "M-s M-x") 'my-kill-buffer-file-name)
(provide 'my-kill-ring-save)
