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
;; speed 空いているキー
;; y, Z, h, G
