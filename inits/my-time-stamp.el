;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-time-stamp.el
;; #+LAST_UPDATED: 2014-04-15
;;=============================================================================
;; cf. url: "http://homepage.mac.com/zenitani/elisp-j.html"
(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-start "LAST_UPDATED: ")
;; * [2011-04-28 木] M-x customize に記述してもいい。
(setq time-stamp-format "%04y-%02m-%02d")
(setq time-stamp-end " \\|$")
(setq time-stamp-line-limit 10) ;; ファイルの先頭から10行以内を探す
