;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-wc.el
;; ============================================================================
;; * [2011-08-29 月] region を wc コマンドに入力した結果を簡単に見たい。
(defun my-region-command-wc-to-minibuffer ()
  "region を wc コマンドに入力した結果をミニバッファに表示する。"
  (interactive)
  (shell-command-on-region (region-beginning) (region-end) "wc")
  )
(global-set-key (kbd "C-z C-x l") 'my-region-command-wc-to-minibuffer)
;; kbd 由来: 類似コマンド count-lines-page {It is bound to C-x l} は、バッファの行数をカウントする。
;; ----------------------------------------------------------------------
;; * [2012-05-20 日] cf. n:/download/Emacs/sample_emacs_d/github.com.shishi/shishi-.emacs.d-9d470cf/inits/05-util.el
;;; P87-89 モードラインに関する設定
;; リージョン内の行数と文字数をモードラインに表示する（範囲指定時のみ）
;; http://d.hatena.ne.jp/sonota88/20110224/1298557375
(defun count-lines-and-chars ()
  (if mark-active
      (format "%d lines,%d chars "
              (count-lines (region-beginning) (region-end))
              (- (region-end) (region-beginning)))
    ""))
(add-to-list 'default-mode-line-format
             '(:eval (count-lines-and-chars)))
