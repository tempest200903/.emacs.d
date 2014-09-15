;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-rotate-keymap-autoload.el
;; ======================================================================
;; * [2014-09-10 水] rotate 導入
;; 関連 my-rotate-package.el
;; ----------------------------------------------------------------------
(require 'my-bind-key-package)
;; ----------------------------------------------------------------------
(let ((p "my-rotate-package"))
  (my-bind-key-with-autoload p "C-M-S-l" 'rotate-layout)
  (my-bind-key-with-autoload p "C-M-S-w" 'rotate-window)
  (my-bind-key-with-autoload p "C-M-S-h" 'rotate:even-horizontal)
  (my-bind-key-with-autoload p "C-M-S-v" 'rotate:even-vertical)
  (my-bind-key-with-autoload p "C-M-S-m" 'rotate:main-horizontal)
  (my-bind-key-with-autoload p "C-M-S-n" 'rotate:main-vertical)
  (my-bind-key-with-autoload p "C-M-S-t" 'rotate:tiled)
  )
