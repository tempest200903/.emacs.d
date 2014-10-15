;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-timer.el
;; #+LAST_UPDATED: 2014-08-28
;; ======================================================================

(defun my-org-timer-start-hour (hour-arg)
  "入力した数値に(-1時間)をかけて org-timer-start"
  (interactive "n[my-org-timer-start-hour] Hours: ")
  (org-timer-start (* -3600 hour-arg))
  )

(defun my-org-timer-start-minute (minute-arg)
  "入力した数値に(-1分)をかけて org-timer-start"
  (interactive "n[my-org-timer-start-minute] Minutes: ")
  (org-timer-start (* -60 minute-arg))
  )

;; ----------------------------------------------------------------------
(provide 'my-org-timer)
