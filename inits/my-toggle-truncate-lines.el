;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-toggle-truncate-lines.el
;; ======================================================================
;; * [2011-02-28]
;; url:http://ubulog.blogspot.com/2007/09/emacsonoff.html
;; 折り返し表示ON/OFF
;;;###autoload
(defun my-toggle-truncate-lines ()
  "折り返し表示をトグル動作します."
  (interactive)
  (if truncate-lines
      (setq truncate-lines nil)
    (setq truncate-lines t))
  (recenter))
;; ----------------------------------------------------------------------
(provide 'my-toggle-truncate-lines)
;; ----------------------------------------------------------------------
;; * [2014-02-21 金] TODO mode-line に truncate-lines を表示する。
