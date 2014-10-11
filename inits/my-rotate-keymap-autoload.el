;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-rotate-keymap-autoload.el
;; 関連 my-rotate-package.el

;; ======================================================================
;; * [2014-09-10 水] rotate 導入
;; ----------------------------------------------------------------------

(when (require 'my-bind-key-package nil t)
  (let ((p "my-rotate-package"))
    (my-bind-key-with-autoload p "C-t C-q" 'my-rotate-window-or-layout-or-tiled)
    (my-bind-key-with-autoload p "C-t h" 'my-rotate-horizontal)
    (my-bind-key-with-autoload p "C-t v" 'my-rotate-vertical)
    )
  )

;; * TODO [2014-09-25 木] my-rotate-horizontal, my-rotate-vertical 2回実行したら balance-windows
