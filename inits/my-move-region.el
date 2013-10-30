;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-10-24
;; my-move-region.el
;; ======================================================================
;; * [2011-04-19 火]
;; Meta+up/downでカーソルと一緒に行を動かす
;; url: http://d.hatena.ne.jp/tototoshi/20100424
;; Ctrl+up/downでカーソルと一緒に領域を動かす
;; url: http://d.hatena.ne.jp/tototoshi/20100425/
 ;; 行
(defun exchange-lines-up ()
  (interactive)
  (if (= 1 (line-number-at-pos))
      nil
    (transpose-lines 1)
    (previous-logical-line 2)))
(defun exchange-lines-down ()
  (interactive)
  (next-logical-line 1)
  (transpose-lines 1)
  (previous-logical-line 1))
;; (global-set-key [(meta up)] 'exchange-lines-up) ; TODO emacs-terminal で使えるか？
;; (global-set-key [(meta down)] 'exchange-lines-down) ; TODO emacs-terminal で使えるか？
(global-set-key [(hyper up)] 'exchange-lines-up)
(global-set-key [(hyper down)] 'exchange-lines-down)
 ;; 領域
(defun line-number-at-mark ()
  (let ((p (point))
        (result nil)
        (m nil))
    (setq m (mark))
    (cond ((null m) nil)
          (t (goto-char m)
             (setq result (line-number-at-pos))
             (goto-char p)
             result))))
(defun push-mark-line (num)
  (let ((p (point)))
    (goto-line num)
    (push-mark)
    (goto-char p)))
(defun move-region-down ()
  (interactive)
  (let ((lp (line-number-at-pos))
        (lm (line-number-at-mark))
        (tmp nil))
    (cond ((> lm lp)
           (setq tmp lm)
           (setq lm lp)
           (setq lp tmp)))
    (goto-line (1+ lp))
    (dotimes (i (- lp lm -1))
      (exchange-lines-up))
    (goto-line (1+ lp))
    (push-mark-line (1+ lm))))
(defun move-region-up ()
  (interactive)
  (let ((lp (line-number-at-pos))
        (lm (line-number-at-mark))
        (tmp nil))
    (cond ((< lm lp)
           (setq tmp lm)
           (setq lm lp)
           (setq lp tmp)))
    (if (= lp 1)
        nil
      (goto-line (1- lp))
      (dotimes (i (- lm lp -1))
        (exchange-lines-down))
      (goto-line (1- lp))
      (push-mark-line (1- lm)))))
(global-set-key (kbd "<H-S-up>") 'move-region-up) ; TODO emacs-terminal で使えるか？
(global-set-key (kbd "<H-S-down>") 'move-region-down) ; TODO emacs-terminal で使えるか？
;; ----------------------------------------------------------------------
;; * [2011-09-16 金] 1行選択。
(defun my-select-line ()
  (interactive)
  (call-interactively 'move-beginning-of-line)
  (call-interactively 'set-mark-command)
  (call-interactively 'move-end-of-line)
  )
;; (global-set-key (kbd "<C-M-return>") 'my-select-line) ; TODO emacs-terminal で使えるか？
(global-set-key (kbd "C-z RET") 'my-select-line)
;; TODO 要望。連続実行 or 引数付き実行したら複数行選択する。
;; ----------------------------------------------------------------------
;; * [2013-09-09 月] 1文字移動。
(defun my-move-char-left ()
  (interactive "*")
  (transpose-chars 1)
  (left-char 2)
  )
(defun my-move-char-right ()
  (interactive "*")
  (right-char 1)
  (transpose-chars 1)
  (left-char 1)
  )
(global-set-key (kbd "<H-right>") 'my-move-char-right)
(global-set-key (kbd "<H-left>")  'my-move-char-left)
