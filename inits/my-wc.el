;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-wc.el
;; ============================================================================
;; * [2011-08-29 月] region を wc コマンドに入力した結果を簡単に見たい。
(defun my-region-command-wc-to-minibuffer ()
  "region を wc コマンドに入力した結果をミニバッファに表示する。"
  (interactive)
  (shell-command-on-region (region-beginning) (region-end) "wc")
  )
;; kbd 由来: 類似コマンド count-lines-page {It is bound to C-x l} は、バッファの行数をカウントする。
