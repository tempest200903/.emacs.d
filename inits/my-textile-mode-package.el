;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-textile-mode-package.el
;; ======================================================================
;; http://dev.nozav.org/textile-mode.html
;; How to Install
;; M-x package-list-packages textile-mode
;; ----------------------------------------------------------------------
(when (package-require 'textile-mode)
  (add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))
  (add-to-list 'auto-mode-alist '("\\.textile.txt\\'" . textile-mode))
  )
