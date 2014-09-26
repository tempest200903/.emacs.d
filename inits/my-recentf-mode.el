;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-08-23 火 15:43] recentf を使う。
;; http://homepage.mac.com/zenitani/elisp-j.html
;; menubar://File/Open Recent が用意される。
;; menubar://File/Open Recent/Options でオプション設定。
(recentf-mode 1)
;; ----------------------------------------------------------------------
;; * [2014-09-26 金] TODO M-x my-rename-file-and-buffer でリネームしたとき、リネーム後のファイル名が recentf に記録されない。
