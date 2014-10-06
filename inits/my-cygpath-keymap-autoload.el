;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2014-10-06
;; my-cygpath-keymap-autoload.el
;; 関連 my-cygpath.el
;; ======================================================================

(my-bind-key-with-autoload "my-cygpath" "C-z c m" 'my-cygpath-m-kill-ring)
(my-bind-key-with-autoload "my-cygpath" "C-z c w" 'my-cygpath-w-kill-ring)
