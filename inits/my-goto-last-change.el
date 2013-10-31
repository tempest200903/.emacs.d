;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2012-03-28
;; my-goto-last-change.el
;; ======================================================================
;; * [2010-10-18 月]
;; url: http://www.bookshelf.jp/soft/meadow_44.html#SEC662
;; url: http://www.emacswiki.org/cgi-bin/wiki/goto-chg.el
;; * [2013-10-30 水]
(autoload 'goto-last-change "goto-last-change"
  "Set point to the position of the last change." t)

(global-set-key (kbd "M-g M-l") 'goto-last-change)
