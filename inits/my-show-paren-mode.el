;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-show-paren-mode.el
;; #+LAST_UPDATED: 2012-02-16
;; ======================================================================
;; * [2012-02-16 木] show-paren-style
;;
;; url: http://www.bookshelf.jp/soft/meadow_42.html
;; 42.9.2 括弧をハイライトする ― show-paren (2003/06/08)
;; 片方の括弧が画面外にある時には，括弧ではなく括弧の中の色が変化します．
;;
;; https://github.com/fujimisakari/.emacs.d/blob/master/inits/04-visual.el
;;

(show-paren-mode t)
(setq show-paren-style 'expression)
(when nil
  (set-face-background 'show-paren-match-face "gray88")
  (set-face-foreground 'show-paren-match-face "Blue")
  )
