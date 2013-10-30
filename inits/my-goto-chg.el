;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;;; #+LAST_UPDATED: 2012-03-28
;;; ======================================================================
;;; ** goto-chg.el
;;; [2010-10-18 月]
;;; url: http://www.bookshelf.jp/soft/meadow_44.html#SEC662
;;; url: http://www.emacswiki.org/cgi-bin/wiki/goto-chg.el
;;; 
;;; <elisp tips> require 第3引数がnon-nilだとloadできなかった場合にエラーではなくnilを返す
;; (require 'goto-chg)
(when (require 'goto-chg nil t) 
  (global-set-key (kbd "M-g M-l") 'goto-last-change)
  )
;; (global-set-key (kbd "<f6>") 'goto-last-change)
