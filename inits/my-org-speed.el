;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
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
;; * [2014-08-06 水] SCHEDULE をリセットして今日の日付にする。
(defun my-org-reset-schedule-today (arg)
  "speed command"
  (interactive "p")
  (org-schedule t)
  (org-schedule nil ".")
)
(defun my-org-reset-schedule-tomorrow (arg)
  "speed command"
  (interactive "p")
  (org-schedule t)
  (org-schedule nil "+3d")
)
;; TODO 1日後が土曜日、日曜日なら次の月曜日にする。もしくは arg で数値を指定可能にする。
;; ----------------------------------------------------------------------
;; speed 空いているキー
;; y, Z, h
