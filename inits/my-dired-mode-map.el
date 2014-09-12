;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-dired-mode-map.el
;; #+LAST_UPDATED: 2013-11-03
;; ======================================================================
;; wdired-change-to-wdired-mode needs my-wdired.el
(define-key dired-mode-map (kbd "r") 'wdired-change-to-wdired-mode)
;; ----------------------------------------------------------------------
;; [2014-09-12 金]
(define-key dired-mode-map (kbd "f") 'popwin:dired-get-file-for-visit) ;; autoload my-popwin.el

