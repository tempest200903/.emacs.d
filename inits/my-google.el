;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED:
;; ======================================================================
;; * [2011-10-20 木] 単語を google で検索
;; http://www.bookshelf.jp/soft/meadow_55.html#SEC821
;; 使い方。
;; M-x google とすると，カーソル付近の単語を拾って，ミニバッファに
;; Search word: google
;; と表示されます．このまま RET を入力すると，ブラウザが起動し，Google でその 単語を検索したページが表示されます．
;; M-x google とする前に，リージョンで選択していると，選択された言葉を検索でき ます．
(load "google")
