;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2012-05-23
;; my-os-type.el
;; ----------------------------------------------------------------------
(cond ((string-match "apple-darwin" system-configuration) ;; Mac
       (setq os-type 'mac))
      ((string-match "linux" system-configuration)        ;; Linux
       (setq os-type 'linux))
      ((string-match "freebsd" system-configuration)      ;; FreeBSD
       (setq os-type 'bsd))
      ((string-match "mingw" system-configuration)        ;; Windows
       (setq os-type 'win)))
(defun os-mac? ()
  (eq os-type 'mac))
(defun os-win? ()
  (or (eq system-type 'windows-nt) (eq system-type 'cygwin)))
;; ----------------------------------------------------------------------
;; cf. http://www.geocities.co.jp/SiliconValley-Bay/9285/ELISP-JA/elisp_606.html
;; cf. Emacs 実践入門 p.64
;; ----------------------------------------------------------------------
(provide 'my-os-type)
