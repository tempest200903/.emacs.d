;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-emacs-lisp-mode-map.el
;; ======================================================================
;; * [2011-08-29 月] elisp 関連
(define-key emacs-lisp-mode-map (kbd "C-c C-x C-e") 'eval-buffer)
(define-key emacs-lisp-mode-map (kbd "C-z C-x C-e") 'eval-region)
