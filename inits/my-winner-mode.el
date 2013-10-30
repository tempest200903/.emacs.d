;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-winner-mode.el
;; =============================================================================
;; http://d.hatena.ne.jp/tomoya/touch/20120512/1336832436
;; 標準搭載なので、すぐにでも使い始めることができます。
;; 例えば意図せずウィンドウを閉じてしまったときに、ウィンドウを復活させたりすることができるのが winner.el です。
;; ;;; winner-mode
;; (when (fboundp 'winner-mode)
;;   (winner-mode t))
;; こちらも導入は簡単。設定ファイルに上のように書くだけ。fboudp の行も不要なくらいです。
;; すると C-c <left> (winner-undo) と C-c <right> (winner-redo) の2つのコマンドが利用できるようになります。
;; winner-undo はもちろんウィンドウの状態を元に戻すコマンドです。ウィンドウ分割だけではなく、バッファの移動履歴も対象です。履歴マニアな方は、ぜひ導入しておくと良いでしょう。
(when (fboundp 'winner-mode)
  (winner-mode t))
