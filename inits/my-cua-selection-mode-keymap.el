;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-cua-selection-mode-keymap.el
;; ======================================================================

(define-key global-map            (kbd "C-z C-\\") 'cua-selection-mode)

(when nil
  (define-key cua--rectangle-keymap (kbd "C-z x")    'cua-cut-rectangle)
  (define-key cua--rectangle-keymap (kbd "C-z v")    'cua-paste)
  )

(let ((file "cua-base"))
  (my-bind-key-with-autoload file "C-z x"     'cua-cut-rectangle)
  (my-bind-key-with-autoload file "C-z v"     'cua-paste)        
  )

;; * TODO Symbol's value as variable is void: cua--rectangle-keymap を防ぐため、 cua-rectangle-mode-hook の中で define-key する。 or autoload
