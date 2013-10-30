;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-11-25 金] sr-speedbar.el 導入
;; url: http://d.hatena.ne.jp/wadap/20100828/1282984286
;; url: http://www.emacswiki.org/emacs/sr-speedbar.el
;; M-x install-elisp-from-emacswiki "sr-speedbar.el"
(require 'sr-speedbar)
(global-set-key (kbd "s-s") 'sr-speedbar-toggle)
;; failure  sr-speedbar-open: Wrong type argument: stringp, nil [2 times]
