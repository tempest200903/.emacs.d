;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-anything-imenu.el
;; ======================================================================
;; * [2012-06-18 月] 要件。ソースファイルのシンボル定義へハイパーリンクでジャンプしたい。
;; ~/.emacs.d/memo/my-emacs-customize.org.txt
;; カーソル位置にあるシンボルを読み取って M-x anything-imenu を実行するコマンドを作っておく。
(defun my-anything-imenu-symbol ()
  (interactive)
  (ffap-copy-string-as-kill)
  (anything-imenu)
  )
(define-key my-anything-map (kbd "C-e") 'my-anything-imenu-symbol)

