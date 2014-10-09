;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-speed.el
;; ======================================================================
;; speed-command で org-clock-mark-default-task などを使うためには、あ
;; らかじめ require しておく必要がある。
(require 'org-clock)
;; ----------------------------------------------------------------------
;; * [2012-06-14 木] 文書先頭や末尾で error 発生する。
(defun my-org-outline-next-visible-heading ()
  "speed command"
  (interactive)
  (org-speed-move-safe (quote outline-next-visible-heading))
  )
(defun my-org-outline-previous-visible-heading ()
  "speed command"
  (interactive)
  (org-speed-move-safe (quote outline-previous-visible-heading))
  )
;; * [2012-06-14 木] 文書先頭や末尾で error 発生しない。
(defun my-org-outline-next-visible-heading ()
  "speed command"
  (interactive)
  (catch 'error (org-speed-move-safe (quote outline-next-visible-heading)))
  )
(defun my-org-outline-previous-visible-heading ()
  "speed command"
  (interactive)
  (catch 'error (org-speed-move-safe (quote outline-previous-visible-heading)))
  )

;; ----------------------------------------------------------------------
;; * [2014-08-06 水] このセクションは my-org-speed.el ではなく別のファイルに置くべき？

(defun my-org-reset-schedule-today (arg)
  "SCHEDULE をリセットして今日の日付にする。"
  (interactive "p")
  (org-schedule t)
  (org-schedule nil ".")
  (message "my-org-reset-schedule-today")
  )

(defun my-org-reset-schedule-tomorrow (arg)
  "SCHEDULE をリセットして明日の日付にする。"
  (interactive "p")
  (org-schedule t)
  (if arg
      (org-schedule nil (format "+%sd" arg))
    (org-schedule nil "+1d")
    )
  (message "my-org-reset-schedule-tomorrow")
  )

(defun my-org-agenda-reset-schedule-today (arg)
  "SCHEDULE をリセットして今日の日付にする。"
  (interactive "p")
  (org-agenda-schedule t)
  (org-agenda-schedule nil ".")
  (message "my-org-agenda-reset-schedule-today")
  )

(defun my-org-agenda-reset-schedule-tomorrow (arg)
  "SCHEDULE をリセットして明日の日付にする。"
  (interactive "p")
  (org-agenda-schedule t)
  (if arg
      (org-agenda-schedule nil (format "+%sd" arg))
    (org-agenda-schedule nil "+1d")
    )
  (message "my-org-agenda-reset-schedule-tomorrow")
  )

(defun my-org-reset-deadline-today (arg)
  "DEADLINE をリセットして今日の日付にする。"
  (interactive "p")
  (org-deadline t)
  (org-deadline nil ".")
  (message "my-org-reset-deadline-today")
  )

(defun my-org-reset-deadline-tomorrow (arg)
  "DEADLINE をリセットして明日の日付にする。"
  (interactive "p")
  (org-deadline t)
  (if arg
      (org-deadline nil (format "+%sd" arg))
    (org-deadline nil "+1d")
    )
  (message "my-org-reset-deadline-tomorrow")
  )

(defun my-org-agenda-reset-deadline-today (arg)
  "DEADLINE をリセットして今日の日付にする。"
  (interactive "p")
  (org-agenda-deadline t)
  (org-agenda-deadline nil ".")
  (message "my-org-agenda-reset-deadline-today")
  )

(defun my-org-agenda-reset-deadline-tomorrow (arg)
  "DEADLINE をリセットして明日の日付にする。"
  (interactive "p")
  (org-agenda-deadline t)
  (if arg
      (org-agenda-deadline nil (format "+%sd" arg))
    (org-agenda-deadline nil "+1d")
    )
  (message "my-org-agenda-reset-deadline-tomorrow")
  )

;; ** [2014-10-01 水] TODO 1日後が土曜日、日曜日なら次の月曜日にする。もしくは arg で数値を指定可能にする。
;; ** [2014-10-08 水] TODO my-org-reset-schedule-today, my-org-reset-schedule-tomorrow を *Org Agenda* buffer で使えるようにする。
;; ** [2014-10-08 水] TODO today の代わりに +1w, +2w, +1m 版を用意する。
;; ----------------------------------------------------------------------
;; speed 空いているキー
;; y, Z, h
