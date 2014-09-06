;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-redo.el
;; ======================================================================
;; * [2012-05-24 木] インストール手順
;; cf. 実践入門 p.114 
;; cf. http://d.hatena.ne.jp/sandai/20120304/p2
;; (install-elisp-from-emacswiki "redo+.el")
;; * [2013-10-31 木] M-x package-install redo+
;; ----------------------------------------------------------------------
(when (require 'redo+ nil t)
  (define-key global-map (kbd "C-/") 'undo)
  (define-key global-map (kbd "C-x C-/") 'redo)
  )
;; auto-load では手遅れ。使うなら my-init.el から load しておくべき。
