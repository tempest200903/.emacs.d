;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-isearch-forward-at-point-keymap-autoload.el
;; 関連 my-isearch-forward-at-point.el
;; ======================================================================
(let ((p "my-isearch-forward-at-point-keymap-autoload"))
  (my-bind-key-with-autoload p "C-w" 'isearch-forward-at-point isearch-mode-map)
  )
