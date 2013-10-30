;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-windmove.el
;; =============================================================================
;; http://d.hatena.ne.jp/tomoya/touch/20120512/1336832436
;; 標準搭載なので、すぐにでも使い始めることができます。
;; ウィンドウ分割時の移動を修飾キー+矢印にする windmove.el。
;;; windmove
;; (windmove-default-keybindings) ; 引数なしの場合は Shift
;; Alt + 矢印でウィンドウを移動する
;; (windmove-default-keybindings 'alt)
(windmove-default-keybindings 'hyper)
;; emacs-terminal で試したところ下記全て動作しなかった。
;; (windmove-default-keybindings 'hyper)
;; (windmove-default-keybindings 'alt)
;; (windmove-default-keybindings 'meta)
;; (windmove-default-keybindings 'ctrl)
