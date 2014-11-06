;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-os-windows-explorer-keymap-autoload.el
;; 関連 my-os-windows-explorer.el
;; #+LAST_UPDATED: 2014-11-04
;; ----------------------------------------------------------------------

(let ((file "my-os-windows-explorer.el"))
  (my-bind-key-with-autoload file "<C-return>"   'my-dired-open-by-w32-shell)
  )
