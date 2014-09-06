;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2012-03-28
;; my-goto-last-change.el
;; ======================================================================
;; * [2010-10-18 月]
;; url: http://www.bookshelf.jp/soft/meadow_44.html#SEC662
;; url: http://www.emacswiki.org/cgi-bin/wiki/goto-chg.el
;; * [2014-09-06 土] インストール手順
;; M-x package-install goto-last-change
(require 'goto-last-change)
(global-set-key (kbd "M-g M-l") 'goto-last-change)
