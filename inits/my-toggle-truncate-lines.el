;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-02-28]
;; url:http://ubulog.blogspot.com/2007/09/emacsonoff.html
;; 折り返し表示ON/OFF
(defun my-toggle-truncate-lines ()
  "折り返し表示をトグル動作します."
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))
(global-set-key (kbd "C-z C-q") 'my-toggle-truncate-lines) 
