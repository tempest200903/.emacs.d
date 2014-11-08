;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-mode-schedule.el

;; ======================================================================
;; * [2014-08-06 水] SCHEDULE をリセットして今日の日付にする。
;; ** [2014-10-01 水] TODO 1日後が土曜日、日曜日なら次の月曜日にする。もしくは arg で数値を指定可能にする。
;; ** [2014-10-08 水] TODO my-org-reset-schedule-today, my-org-reset-schedule-tomorrow を *Org Agenda* buffer で使えるようにする。
;; ** [2014-10-08 水] TODO today の代わりに +1w, +2w, +1m 版を用意する。

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

(defun my-org-agenda-reset-schedule-1week (arg)
  "SCHEDULE をリセットして明日の日付にする。"
  (interactive "p")
  (org-agenda-schedule t)
  (if arg
      (org-agenda-schedule nil (format "+%sd" arg))
    (org-agenda-schedule nil "+1w")
    )
  (message "my-org-agenda-reset-schedule-1week")
  )


(defun my-org-agenda-reset-schedule-1month (arg)
  "SCHEDULE をリセットして明日の日付にする。"
  (interactive "p")
  (org-agenda-schedule t)
  (if arg
      (org-agenda-schedule nil (format "+%sd" arg))
    (org-agenda-schedule nil "+4w")
    )
  (message "my-org-agenda-reset-schedule-1month")
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

(defun my-org-agenda-reset-deadline-1week (arg)
  "DEADLINE をリセットして明日の日付にする。"
  (interactive "p")
  (org-agenda-deadline t)
  (if arg
      (org-agenda-deadline nil (format "+%sd" arg))
    (org-agenda-deadline nil "+1w")
    )
  (message "my-org-agenda-reset-deadline-1week")
  )

(defun my-org-agenda-reset-deadline-1month (arg)
  "DEADLINE をリセットして明日の日付にする。"
  (interactive "p")
  (org-agenda-deadline t)
  (if arg
      (org-agenda-deadline nil (format "+%sd" arg))
    (org-agenda-deadline nil "+4w")
    )
  (message "my-org-agenda-reset-deadline-1month")
  )

