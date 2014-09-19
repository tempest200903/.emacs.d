;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-countdown.el
;; #+LAST_UPDATED: 2014-09-19
;; ======================================================================
(require 'org)
;; * [2014-09-19 金] "次の SCHEDULE までの秒数をカウントダウンする"
(defun my-org-countdown-start ()
  "次の SCHEDULE までの秒数をカウントダウンする"
  (interactive)
  (let ((timer-offset
         (my-org-countdown-calc-time-diff
          (my-org-countdown-conver-to-float
           (my-org-countdown-scan-next-schedule-time)))))
    (org-timer-start (floor timer-offset))
    )
  )
;;
(defun my-org-countdown-scan-next-schedule-time ()
  "*Org Agenda* バッファから次の schedule 時刻を読み取る"
  (let (
        (org-agenda-buffer-name "*Org Agenda*")
        (regexp-scheduled "[0-9]+:[0-9]+.*Scheduled: ")
        )
    (if (get-buffer org-agenda-buffer-name)
        (progn
          (switch-to-buffer org-agenda-buffer-name)
          (beginning-of-buffer)
          (occur regexp-scheduled)
          (next-error)
          (delete-other-windows)
          (set-mark-command nil)
          (forward-word 2)
          (buffer-substring (region-beginning) (region-end))
          )
      nil
      )
    )
  )
;; TODO バグ my-org-countdown-scan-next-schedule-time 現在時刻より前の schedule を読み取ってしまう。
;; now よりあとを読み取るべし。
;;
;; (my-org-countdown-conver-to-float "00:00")
;; (my-org-countdown-conver-to-float "23:50")
(defun my-org-countdown-conver-to-float (time-string)
  "文字列の HOUR:MINUTE を秒に変換する。"
  (when time-string
    (let* (
           ;; 今日の日付。
           (YEAR        (string-to-number (format-time-string "%Y" (current-time))))
           (MONTH       (string-to-number (format-time-string "%m" (current-time))))
           (DAY         (string-to-number (format-time-string "%d" (current-time))))
           (SECOND      0)
           (MINUTE      (string-to-number (elt (split-string time-string ":") 1)))
           (HOUR        (string-to-number (elt (split-string time-string ":") 0)))
           )
      ;; schedule-time を秒に変換する。とりあえず日付は今日に決め打ち。
      (float-time (encode-time SECOND MINUTE HOUR DAY MONTH YEAR))
      )
    )
  )
;;
;; (my-org-countdown-calc-time-diff "23:59")
(defun my-org-countdown-calc-time-diff (schedule-time-float)
  "(current-time) から schedule-time-float を引き算した結果を返す"
  (when schedule-time-float)
  (- (float-time (current-time)) schedule-time-float)
  )
;; ----------------------------------------------------------------------
(defadvice org-agenda-goto-today (after org-agenda-goto-today-my-org-countdown-start activate)
  "docstring"
  (my-org-countdown-start)
  )
;; TODO [2014-09-19 金] トリガーを org-agenda-goto-today 直後、かつ、 view day である場合に限定するべき。
;; view week などでは正常に機能しない。 
;; defvar org-agenda-current-span に "week" などが入っている。これを見ればいい。
;; ----------------------------------------------------------------------
;; デバッグ用。
(when nil
  (progn
    (bind-key "<f8>" 'my-eval-buffer-or-region emacs-lisp-mode-map)
    (bind-key "<f9>" 'my-org-countdown-start)
    )
  )
