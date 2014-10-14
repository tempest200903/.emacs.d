;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-narrow-indirect-package.el
;; 関連 my-indirect-mode.el
;; ======================================================================

(package-require 'narrow-indirect)

;; M-x customize-group Narrow-Indirect

(define-key global-map (kbd "C-x 4 n d") 'ni-narrow-to-defun-indirect-other-window)
(define-key global-map (kbd "C-x 4 n n") 'ni-narrow-to-region-indirect-other-window)
(define-key global-map (kbd "C-x 4 n p") 'ni-narrow-to-page-indirect-other-window)
