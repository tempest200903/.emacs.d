;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-keyfreq.el
;; =============================================================================
;; install: M-x package-install keyfreq
;; (require 'keyfreq) ;; package.elからインストールした場合は不要

;; (keyfreq-mode 0)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)
(message "M-x keyfreq-show")
