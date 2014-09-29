;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-loccur-keymap-autoload.el
;; ======================================================================
(require 'my-bind-key-package)
(let ((p "my-loccur-package"))
  (my-bind-key-with-autoload p "M-s l c" 'loccur-current)
  (my-bind-key-with-autoload p "M-s l l" 'loccur)
  (my-bind-key-with-autoload p "M-s l p" 'loccur-previous-match)
  (my-bind-key-with-autoload p "M-s l d" 'loccur-defun)
  (my-bind-key-with-autoload p "M-s l t" 'loccur-toggle-highlight)
  )
