;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2012-02-15
;; ======================================================================
;; * [2012-02-15 水] mark-multiple
;; url: http://d.hatena.ne.jp/syohex/20120206/1328540927
;; url: https://github.com/magnars/mark-multiple.el
(when t
      (load "~/.emacs.d/mark-multiple/inline-string-rectangle.el")
      (load "~/.emacs.d/mark-multiple/mark-more-like-this.el")
      (load "~/.emacs.d/mark-multiple/mark-multiple.el")
      (load "~/.emacs.d/mark-multiple/rename-sgml-tag.el")
)

(require 'mark-more-like-this)
(global-set-key (kbd "C-<") 'mark-previous-like-this)
(global-set-key (kbd "C->") 'mark-next-like-this)
