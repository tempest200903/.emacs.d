;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-rotate-keymap-autoload.el
;; ======================================================================
;; * [2014-09-10 水] rotate 導入
;; 関連 my-rotate-package.el
;; ----------------------------------------------------------------------
(require 'my-bind-key-package)
;; ----------------------------------------------------------------------
(let ((p "my-rotate-package"))
  (my-bind-key-with-autoload p "C-t C-q" 'my-rotate-window-or-layout-or-tiled)
  (my-bind-key-with-autoload p "C-t h" 'my-rotate-horizontal)
  (my-bind-key-with-autoload p "C-t v" 'my-rotate-vertical)
  )
