;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-09-02 金] 単語2個を入れ替える。
;; - url: http://www.emacswiki.org/emacs/QueryExchange

(defun my-query-exchange (string-1 string-2)
  "Exchange string-1 and string-2 interactively. The user is prompted at each instance like query-replace."
  (interactive "sString 1: \nsString 2: ")
  (perform-replace
   (concat "\\(" string-1 "\\)\\|" string-2)
   '(replace-eval-replacement replace-quote 
                              (if (match-string 1) string-2 string-1))
   t t nil))
