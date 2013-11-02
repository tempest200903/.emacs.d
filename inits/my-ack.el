;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-ack.el
;; ----------------------------------------------------------------------
;; [2011-01-21 金 13:37]
;; url: http://d.hatena.ne.jp/antipop/20080311/1205252552
;; 文字コードを指定可能にしたい。
(defun ack-default ()
  (interactive)
  (let ((grep-find-command "ack --nocolor --nogroup "))
    (call-interactively 'grep-find))
  )
(defun ack-utf-8-t1 ()
  (interactive)
  (universal-coding-system-argument "utf-8")
  (ack-default)
  )
;; 失敗。
(defun ack-utf-8-t2 ()
  (interactive)
  (let (
        (coding-system "utf-8")
        (coding-system-for-read coding-system)
        (coding-system-for-write coding-system)
        (coding-system-require-warning t)
        (current-prefix-arg prefix))
    (message "")
    (call-interactively 'ack-default))
)
;; 失敗。
