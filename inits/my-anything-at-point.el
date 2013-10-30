;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ============================================================================
;; * [2012-02-07 火] C-u を省略した anything-at-point
(defun my-anything-at-point (&optional
                             any-sources any-input
                             any-prompt any-resume
                             any-preselect any-buffer)
  "C-u を省略した anything-at-point"
  (interactive)
  (setq current-prefix-arg t)
  (anything-at-point)
  )
(define-key my-anything-map (kbd "C-u") 'my-anything-at-point)
;; wishlist. mark-active であるときは範囲指定した文字列を occur してほしい。
