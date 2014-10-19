;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-direx-keymap-autoload.el
;; 関連 my-direx-package.el

;; ======================================================================

(let ((file "my-direx-package"))
  (my-bind-key-with-autoload file "C-z C-x C-j" 'direx:jump-to-directory        global-map )
  )

