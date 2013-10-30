;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; denepnds=my-anything-basis.el
;; ======================================================================
;; * [2011-12-26 月] iocollect/recent/recent_month を occur する。
(defun my-anything-iocollect-month ()
  (interactive)
  (select-frame (make-frame-command))
  (find-file-read-only "N:/4-project/iocollect/recent/recent_month.txt")
  (anything-occur)
  )
(define-key my-anything-map (kbd "C-^") 'my-anything-iocollect-month)
;; * 課題
;; ** action 「 goto-line, ffap-copy-string-as-kill 」
;; ** action 「 goto-line, ffap-copy-string-as-kill, bluewind paste 」

