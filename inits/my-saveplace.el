;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-saveplace.el
;; =============================================================================
;; [2013-12-09 月] http://qiita.com/catatsuy/items/55d50d13ebc965e5f31e
;; カーソルの位置を保存する
;; 長いファイルになるとカーソルの位置も復元して欲しいので必須です
;; 30-saveplace.el
(require 'saveplace)
(setq-default save-place t)
