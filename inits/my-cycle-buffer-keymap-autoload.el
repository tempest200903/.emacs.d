;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-cycle-buffer-keymap-autoload.el
;; 関連 my-cycle-buffer.el
;; #+LAST_UPDATED: 2014-10-19
;; ======================================================================

(let ((file "my-cycle-buffer.el"))
  (my-bind-key-with-autoload file "<f12>"   'cycle-buffer)                          
  (my-bind-key-with-autoload file "<f11>"   'cycle-buffer-backward)                 
  (my-bind-key-with-autoload file "<S-f12>" 'cycle-buffer-backward-permissive)      
  (my-bind-key-with-autoload file "<S-f11>" 'cycle-buffer-permissive)               
  )
