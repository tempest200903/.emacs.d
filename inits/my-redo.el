;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-redo.el ★廃止する予定。
;; =============================================================================
;; * [2012-05-24 木] 実践入門 p.114 
;; http://d.hatena.ne.jp/sandai/20120304/p2
;; (when (not (require 'redo+ nil t))
;;   (install-elisp-from-emacswiki "redo+.el")
;;   )
;; * [2013-10-31 木] M-x package-install redo+
(when (require 'redo+ nil t)
  (define-key global-map (kbd "C-/") 'undo)
  (define-key global-map (kbd "C-x C-/") 'redo)
  )
(provide 'my-redo)
