;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-narrow-indirect-keymap-autoload.el
;; 関連 my-narrow-indirect-package.el
;; #+LAST_UPDATED: 2014-10-15
;; ======================================================================

(let ((file "my-narrow-indirect-package"))
  (my-bind-key-with-autoload file "C-x 4 n d" 'ni-narrow-to-defun-indirect-other-window)  
  (my-bind-key-with-autoload file "C-x 4 n n" 'ni-narrow-to-region-indirect-other-window) 
  (my-bind-key-with-autoload file "C-x 4 n p" 'ni-narrow-to-page-indirect-other-window)   
  )
