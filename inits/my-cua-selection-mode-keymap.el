;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-cua-selection-mode-keymap.el
;; ======================================================================

(define-key global-map            (kbd "C-z C-\\") 'cua-selection-mode)
(define-key cua--rectangle-keymap (kbd "C-z x")    'cua-cut-rectangle)
(define-key cua--rectangle-keymap (kbd "C-z v")    'cua-paste)
