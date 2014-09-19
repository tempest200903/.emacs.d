;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-countdown.el
;; #+LAST_UPDATED: 2014-09-19
;; ======================================================================
(require 'org)
;; * [2014-09-19 金] "次の SCHEDULE までの秒数をカウントダウンする"
;; デバッグ用→ (my-org-timer-start-safe -1250.2650)
(defun my-org-countdown-start ()
  "次の SCHEDULE までの秒数をカウントダウンする"
  (interactive)
  (my-org-timer-start-safe
   (my-org-countdown-calc-time-diff
    (my-org-countdown-conver-to-float
     (my-org-countdown-scan-next-schedule-time)))
   )
  )
;; デバッグ用→ (my-org-timer-start-safe -769.5)
(defun my-org-timer-start-safe (OFFSET)
  "OFFSET が数値ならば org-timer-start. さもなくば何もしない"
  (if OFFSET
      (if (numberp OFFSET)
          (org-timer-start (floor OFFSET))
        (message "OFFSET is not number: {%s}" OFFSET)
        )
    (message "OFFSET is nil")
    )
  )
(defun my-org-countdown-scan-next-schedule-time ()
  "*Org Agenda* バッファから次の schedule 時刻を読み取る"
  (let (
        (org-agenda-buffer-name "*Org Agenda*")
        (regexp-now "now")
        (regexp-scheduled ":[0-9]+:[0-9]+.*Scheduled: ")
        )
    (if (get-buffer org-agenda-buffer-name)
        (if (string-equal org-agenda-current-span "day")
            (progn
              (switch-to-buffer org-agenda-buffer-name)
              (beginning-of-buffer)
              (re-search-forward regexp-now) ;; now が見つからない場合は中止する。
              (re-search-forward regexp-scheduled) ;; Schedule が見つからない場合は中止する。
              (re-search-backward regexp-scheduled)
              (delete-other-windows)
              (forward-char 1)
              (set-mark-command nil)
              (forward-word 2)
              (buffer-substring (region-beginning) (region-end))
              )
          ;; org-agenda-current-span が day でない場合は動作しない。
          (message "[my-org-countdown-scan-next-schedule-time] org-agenda-current-span shoud be day")
          nil
          )
      ;; agenda buffer が見つからない場合は中止する。
      (message "[my-org-countdown-scan-next-schedule-time] FAILED get-buffer")
      nil
      )
    )
  )
;; デバッグ用→ (my-org-countdown-conver-to-float "00:00")
;; デバッグ用→ (my-org-countdown-conver-to-float "23:50")
(defun my-org-countdown-conver-to-float (time-string)
  "文字列の HOUR:MINUTE を秒に変換する。"
  (when t (message "time-string{%s}" time-string) nil) ; ←デバッグ用。
  (when time-string
    (let* (
           ;; 今日の日付。
           (YEAR        (string-to-number (format-time-string "%Y" (current-time))))
           (MONTH       (string-to-number (format-time-string "%m" (current-time))))
           (DAY         (string-to-number (format-time-string "%d" (current-time))))
           (SECOND      0)
           (MINUTE      (string-to-number (elt (split-string time-string ":") 1)))
           (HOUR        (string-to-number (elt (split-string time-string ":") 0)))
           ;; schedule-time を秒に変換する。とりあえず日付は今日に決め打ち。
           (result      (float-time (encode-time SECOND MINUTE HOUR DAY MONTH YEAR)))
           )
      (when t (message " my-org-countdown-conver-to-float result{%s}" result)) ; ←デバッグ用。
      result
      )
    )
  )
;;
;; (my-org-countdown-calc-time-diff "23:59")
(defun my-org-countdown-calc-time-diff (schedule-time-float)
  "(current-time) から schedule-time-float を引き算した結果を返す"
  (if (numberp schedule-time-float)
      (- (float-time (current-time)) schedule-time-float)
    (message "schedule-time-float is nil")
    nil
    )
  )
;; ----------------------------------------------------------------------
(defadvice org-agenda-goto-today (after org-agenda-goto-today-my-org-countdown-start activate)
  "docstring"
  (my-org-countdown-start)
  )
;; ----------------------------------------------------------------------
;; デバッグ用。
(when nil
  (progn
    (defun a () "" (interactive) (my-org-countdown-scan-next-schedule-time))
    (defun b () "" (interactive) (org-timer-stop) (my-eval-buffer-or-region nil))
    (defun c () "" (interactive) (org-timer-stop) (eval-buffer))
    (define-key emacs-lisp-mode-map (kbd "<f8>") 'c)
    (define-key global-map (kbd "<f9>") 'my-org-countdown-start)
    (define-key global-map (kbd "<f10>") 'a)
    )
  )
