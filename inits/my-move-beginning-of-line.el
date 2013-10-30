;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-move-beginning-of-line.el
;; =============================================================================
;; http://www.ftnk.jp/~fumi/cl/2010-02-02-3.html
(defun my-move-beginning-of-line ()
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))
;; C-a は org-mode で org-beginning-of-line に使用中。
;; M-m デフォルト定義から変更する。
;; M-m runs the command back-to-indentation, which is an interactive compiled Lisp function in `simple.el'.
(global-set-key (kbd "M-m") 'my-move-beginning-of-line)
