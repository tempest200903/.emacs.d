;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-custom-file.el
;; #+LAST_UPDATED: 2014-10-18
;; ======================================================================

(setq emacs_custom (getenv "EMACS_CUSTOM"))
(setq custom-file (concat user-emacs-directory emacs_custom "/my-emacs-custom.el"))
(load custom-file)
