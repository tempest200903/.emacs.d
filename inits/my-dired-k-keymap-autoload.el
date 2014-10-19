;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-dired-k-keymap-autoload.el
;; 関連 my-dired-k-package.el

;; ======================================================================

(let ((file "my-dired-k-package"))
  (my-bind-key-with-autoload file "g" 'dired-k dired-mode-map )
  )
