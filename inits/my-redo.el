;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; =============================================================================
;; * [2012-05-24 木] 実践入門 p.114 
(when (not (require 'redo+ nil t))
  (install-elisp-from-emacswiki "redo+.el")
  )
(when (require 'redo+ nil t)
  (define-key global-map (kbd "C-/") 'undo)
  (define-key global-map (kbd "C-x C-/") 'redo)
  )
