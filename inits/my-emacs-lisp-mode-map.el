;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-emacs-lisp-mode-map.el
;; ======================================================================
(define-key emacs-lisp-mode-map (kbd "C-c C-x C-e") 'eval-buffer)
(define-key emacs-lisp-mode-map (kbd "C-z C-x C-e") 'eval-region)
