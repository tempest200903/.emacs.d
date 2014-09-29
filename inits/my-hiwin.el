;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-hiwin.el
;; ======================================================================
;; * [2014-09-27 土] http://d.hatena.ne.jp/kenbeese/20120408/title
;; emacsのアクティブウィンドウと非アクティブウィンドウの色を変える。 - Linux, Mac, Emacsについての設定、覚え書き
;; ----------------------------------------------------------------------
;; * [2014-09-12 金] インストール手順: package-require 式を eval-last-sexp する。
(when (package-require 'hiwin)
   (hiwin-activate)                           ;; hiwin-modeを有効化
   (set-face-background 'hiwin-face "gray90") ;; 非アクティブウィンドウの背景色を設定
  )
