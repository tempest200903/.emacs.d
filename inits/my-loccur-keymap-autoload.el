;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-loccur-keymap-autoload.el
;; ======================================================================
(require 'my-bind-key-package)
(let ((p "my-loccur-package"))
  (my-bind-key-with-autoload p "M-s M-l M-c" 'loccur-current)
  (my-bind-key-with-autoload p "M-s M-l M-l" 'loccur)
  (my-bind-key-with-autoload p "M-s M-l M-p" 'loccur-previous-match)
  (my-bind-key-with-autoload p "M-s M-l M-d" 'loccur-defun)
  (my-bind-key-with-autoload p "M-s M-l M-t" 'loccur-toggle-highlight)
  )
