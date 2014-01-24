;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-picture-mode.el
;; ======================================================================
;; * [2011-05-19 木] picture-mode 用のコマンドを global に使いたい。
;; ** picture-duplicate-line 
;; "Insert a duplicate of the current line, below it."
;; "行を複製する。"
;; (when (require 'picture nil t)
;;   (global-set-key (kbd "C-z C-y") 'picture-duplicate-line)
;;   )
;; [2014-01-18 土] my-autoload.el, my-keymap-basis.el に移転する。 my-picture-mode.el は廃止する。
