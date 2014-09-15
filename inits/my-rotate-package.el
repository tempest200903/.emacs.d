;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2014-09-14
;; my-rotate-package.el
;; my-rotate-keymap-autoload.el
;; ======================================================================
;; * [2014-09-10 水] rotate 導入
;; - (package-require 'rotate nil nil t) を eval する。
;; http://a-newcomer.com/56
;; https://github.com/daic-h/emacs-rotate
;; ----------------------------------------------------------------------
(when (and
       (package-require 'rotate nil nil t)
       t)
  )
;; ----------------------------------------------------------------------
(provide 'my-rotate-package)
;; ----------------------------------------------------------------------
