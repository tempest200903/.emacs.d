;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-jump.el
;; #+LAST_UPDATED: 2014-10-16
;; ======================================================================

(defvar my-timestamp-regexp "\\(<\\|\\[\\)20??-??-??")

(defun my-org-next-timestamp (arg)
  "次のタイムスタンプへ行く"
  (interactive "p")
  (search-forward-regexp my-timestamp-regexp)
  )

(defun my-org-previous-timestamp (minute-arg)
  "入力した数値に(-1分)をかけて org-timer-start"
  (interactive "p")
  (search-backward-regexp my-timestamp-regexp)
  )

;; * [2014-10-16 木] TODO C-u ありなら property をスキップする。 ( LOGBOOK の中や DEADLINE など をスキップする)

;; * [2014-10-16 木] TODO my-org-next-checkbox, my-org-previous-checkbox

;; ----------------------------------------------------------------------
(provide 'my-org-jump)
