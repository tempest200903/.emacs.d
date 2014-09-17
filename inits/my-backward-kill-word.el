;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-09-12
;; ======================================================================
;; * [2012-01-27 金] Making Ctrl+W a tad smarter 
;; - http://d.akinori.org/2007/07/03/20070703p01/
;; - emacs の Ctrl+W を shell の Ctrl+W のようにも使えるようにする。
;; - マークがアクティブであれば kill-region する。もともとの Ctrl+W の動作。
;; - そうでなければ backward-kill-word する。もともとの <C-backspace> や shell の動作。
(defun kill-region-or-backward-kill-word (&optional arg)
  "Kill a region or a word backward."
  (interactive)
  (if mark-active
      (kill-region (mark) (point))
    (backward-kill-word (or arg 1))))
;; ----------------------------------------------------------------------
;; * [2012-05-20 日] cf. n:/download/Emacs/sample_emacs_d/github.com.shishi/shishi-.emacs.d-9d470cf/inits/05-util.el
;; カーソル位置の単語を削除
(defun kill-word-at-point ()
  (interactive)
  (let ((char (char-to-string (char-after (point)))))
    (cond
     ((string= " " char) (delete-horizontal-space))
     ((string-match "[\t\n -@\[-`{-~]" char) (kill-word 1))
     (t (forward-char) (backward-word) (kill-word 1)))))
;; TODO M-d kill-word との違いは何？
;; ----------------------------------------------------------------------
(provide 'my-backward-kill-word)
