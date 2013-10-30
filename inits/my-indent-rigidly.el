;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-09-11
;; my-indent-rigidly.el
;; ======================================================================
;; * [2013-09-11 水] 
;; http://d.hatena.ne.jp/kitokitoki/20090903/p3

(defun my-indent-rigidly (ARG)
  "indent-rigidly でインデント数を後から指定するラッパー関数"
  (interactive "*nインデント数: ")
  (if (and transient-mark-mode mark-active)
      (indent-rigidly
       (region-beginning)
       (region-end)
       ARG)
    (error "No region selected.")
    ))

(defun my-indent-rigidly-back (ARG)
  "indent-rigidly NEGATIVE"
  (interactive "*pインデント数")
  (if (and transient-mark-mode mark-active)
      (indent-rigidly
       (region-beginning)
       (region-end)
       (* -1 ARG))
    (error "No region selected.")
    ))

(global-set-key (kbd "C-z TAB")                 'my-indent-rigidly)
(global-set-key (kbd "C-x <backtab>")           'my-indent-rigidly-back)
