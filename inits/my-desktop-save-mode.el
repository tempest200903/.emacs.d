;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2013-09-11 水] 
;; DeskTop http://www.emacswiki.org/DeskTop
;; Emacs の Commands History を再起動後も使用する - Qiita [キータ] - http://qiita.com/akisute3@github/items/4b489c0abbb39a5dcc45
;; (setq desktop-globals-to-save '(extended-command-history))
;; (setq desktop-files-not-to-save "")
;; (desktop-save-mode 1)
;; desktop-save-mode というものが Emacs で標準に付いているのだが、標準だと Commands History 以外の情報まで永続的に残してしまうので、上2行で他の情報を保存しないようにしている。desktop-save-mode ではバッファなども保存可能

(setq desktop-globals-to-save '(extended-command-history))
(setq desktop-files-not-to-save "")
;; (setq history-length 100) ;; M-x customize で変更した。
(desktop-save-mode 1)

;; [2013-09-12 木] 動作が遅いので無効にして様子を見る。
