;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2011-10-27
;; --------------------------------------------------------------
;; * [2011-05-27 金] tips
;; [Source: http://www.fan.gr.jp/~ring/Meadow/meadow.html]
;; kill-ring に同じ内容の文字列を複数入れない
;; 以下を ~/.emacs に追加すれば、 kill-ring-save 等した時にその内容が既に kill-ring にある場合、その文字列が kill-ring の先頭に 1 つにまとめられます。
;; (defadvice kill-new (before ys:no-kill-new-duplicates activate)
;;   (setq kill-ring (delete (ad-get-arg 0) kill-ring)))
;;
(defadvice kill-new (before ys:no-kill-new-duplicates activate)
  (setq kill-ring (delete (ad-get-arg 0) kill-ring)))
