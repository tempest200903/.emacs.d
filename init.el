;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; #+LAST_UPDATED: 2013-11-11
;; ======================================================================
;; * load
;; 
;; [2013-11-08 金] IME on のとき入力文字列が他のフレームにいってしまう不具合発生。いったん無効にして様子を見る。
;; [2013-11-11 月] ~/.emacs.d/inits/my-workmanager.el my-workmanager-write-file が utf-8 の代わりに sjis で出力してしまうので支障がある。有効に戻す。
;; (load "~/.emacs.d/gnupack-init")
;;
(load "~/.emacs.d/inits/my-init")
;; ----------------------------------------------------------------------
;; * disabled
(put 'scroll-left 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
