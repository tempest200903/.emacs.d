;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-visual-regexp-keymap-autoload.el
;; ======================================================================
(require 'my-bind-key-package)
(let ((p "my-visual-regexp-package"))
  (my-bind-key-with-autoload p "M-s M-v" 'vr/replace)
  (my-bind-key-with-autoload p "M-s M-r" 'vr/query-replace)
  )
