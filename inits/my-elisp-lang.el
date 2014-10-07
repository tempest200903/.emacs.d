;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-09-12
;; my-elisp-lang.el
;; ======================================================================

;; * [2014-10-07 火] http://www.emacswiki.org/emacs/ElispCookbook

(defun string/ends-with (s ending)
  "Return non-nil if string S ends with ENDING."
  (cond ((>= (length s) (length ending))
         (let ((elength (length ending)))
           (string= (substring s (- 0 elength)) ending)))
        (t nil)))
(defun string/starts-with (s begins)
  "Return non-nil if string S starts with BEGINS."
  (cond ((>= (length s) (length begins))
         (string-equal (substring s 0 (length begins)) begins))
        (t nil)))

(provide 'my-elisp-lang)

;; e.g.
;; (string/starts-with "http://orgmode.org/worg/org-tutorials/org-custom-agenda-commands.html" "http")

;; * [2014-10-07 火] TODO regex が使える string/starts-with, string/ends-with
