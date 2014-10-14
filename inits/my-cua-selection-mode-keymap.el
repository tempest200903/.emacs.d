;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-cua-selection-mode-keymap.el
;; ======================================================================

(define-key global-map            (kbd "C-z C-\\") 'cua-selection-mode)
(define-key global-map            (kbd "C-z x") 'cua-cut-rectangle)
(define-key global-map            (kbd "C-z v") 'cua-paste)

(when nil
  (let ((file "cua-base"))
    (my-bind-key-with-autoload file "C-z x"     'cua-cut-rectangle)
    (my-bind-key-with-autoload file "C-z v"     'cua-paste)
    )
  )

;; * [2014-10-14 火] TODO Symbol's value as variable is void: cua--rectangle-keymap を防ぐため、 cua-rectangle-mode-hook の中で define-key する。 or autoload
;; * [2014-10-14 火] TODO cua-cut-rectangle,cua-paste をどの keymap に bind すればいいか分からない。とりあえず、 global-map に bind しておく。
