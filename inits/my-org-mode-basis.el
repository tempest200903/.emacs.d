;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; my-org-mode-basis.el
;; #+LAST_UPDATED: 2013-10-23
;; ----------------------------------------------------------------------
(message "[my-org-mode-basis.el] BEGIN")
;; ----------------------------------------------------------------------
;; 拡張子がorgのファイルを開いた時，自動的にorg-modeにする
(add-to-list 'auto-mode-alist '("\\.howm.txt$" . org-mode))
(add-to-list 'auto-mode-alist '("\\.org.txt$" . org-mode))
;; ----------------------------------------------------------------------
(message "[my-org-mode-basis.el] END")
