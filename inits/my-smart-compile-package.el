;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-smart-compile-package.el
;; ======================================================================
;; * [2013-09-20 金] インストール方法
;; M-x package-list-packages smart-compile install
;; M-x smart-compile
;; ----------------------------------------------------------------------
;; http://th.nao.ac.jp/MEMBER/zenitani/elisp-j.html#smart-compile
;; ----------------------------------------------------------------------

(require 'smart-compile)

(global-set-key (kbd "C-z C-@")     'smart-compile)
