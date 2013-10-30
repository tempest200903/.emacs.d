;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-copy-line.el
;; ----------------------------------------------------------------------
;; http://www.emacswiki.org/emacs/CopyingWholeLines
(defun my-copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (set-mark-command nil) (set-mark-command nil) ;; 現在位置をマークする。
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
;; wishlist my-copy-line 連打したらコピー範囲を1行ずつ拡大してほしい。
;; ----------------------------------------------------------------------
;; * join 関連
(defun my-join-line-next () "現在行と直後の行をつなげる。あいだの空白を削除する。"
  (interactive "*")
  (join-line -1)
  (set-mark-command nil) (set-mark-command nil) ;; 現在位置をマークする。
  )
;; Tips
;; M-x join-line                現在行と直前の行をつなげる。あいだの空白を削除する。
;; C-u 1 M-x join-line          現在行と直後の行をつなげる。あいだの空白を削除する。
;; 後者の方をよく使うので、 C-u なしで使えるようにする。
;; ----------------------------------------------------------------------
(global-set-key (kbd "C-z C-w") 'my-copy-line)
(global-set-key (kbd "C-z C-k") 'kill-whole-line)
					; Tips. C-z C-k C-; C-; ... で範囲拡大。
(global-set-key (kbd "C-z C-j") 'my-join-line-next) 
					; Tips. C-z C-j C-; C-; ... で範囲拡大。
