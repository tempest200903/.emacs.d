;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-09-12
;; my-kill-ring-save.el
;; ======================================================================
;; * [2012-01-27 金] mark-active かそうでないかで2種類の動作をする。 
;; my-ffap-copy-string-as-kill.el と同様。
(defun my-kill-ring-save-or-ffap-copy-string-as-kill (&optional arg)
  "if mark-active then kill-ring-save else ffap-copy-string-as-kill."
  (interactive)
  (if mark-active
      (kill-ring-save (mark) (point))
    (ffap-copy-string-as-kill)))
;; 
(defun my-kill-buffer-file-name (&optional arg)
  "kill buffer-file-name. if arg is 4 then replace HOME to ~."
  (interactive "P")
  (let* (
         (b1 (buffer-file-name))
         (h1 (replace-regexp-in-string "\\\\" "/" (getenv "HOME")))
         (b2 (replace-regexp-in-string h1 "~" b1))
         )
    (cond
     (current-prefix-arg        (kill-new b2) (message b2))
     (t                         (kill-new b1) (message b1)))
    )
  )
;; ----------------------------------------------------------------------
;; * wishlist
;; ** [2014-09-18 木] TODO file-name を扱うコマンド全般について、
;; cygpath -w 形式と cygpath -u 形式を使い分けたい。
;; (defun my-cygpath-toggle ... )
;; ** [2014-09-18 木] kill-ring に入っている path を
;; cygpath -w 形式または cygpath -u 形式に変換するコマンド。
;; 明示的にどちらの形式にするか選択するか、
;; 実行するたびに自動判別して他方で出力する。
;; ** [2014-09-18 木] 特別なコマンドを実行しなくても kill する時点で
;; 事前に選択した形式に自動的に変換する minor-mode
;; Windows アプリケーション( Excel など)や外部(Redmine)
;; に貼り付けるときは、これがあると便利。
;; prefer-coding-system のような感じ。
;; ** [2014-09-18 木] region に登場する path を一括変換するコマンド。
;; ----------------------------------------------------------------------
(provide 'my-kill-ring-save) ;; goto my-autoload.el
;; ----------------------------------------------------------------------
