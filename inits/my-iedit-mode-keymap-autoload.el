;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-iedit-mode-keymap-autoload.el
;; 関連 my-iedit-mode-package.el
;; ======================================================================
;; (let ((file "my-iedit-mode-package"))
;;   (my-bind-key-with-autoload file   "C-;"     'iedit-mode                      global-map      )
;;   (my-bind-key-with-autoload file   "C-;"     'iedit-mode                      isearch-mode-map)
;;   (my-bind-key-with-autoload file   "C-;"     'iedit-execute-last-modification esc-map         )
;;   (my-bind-key-with-autoload file   "C-;"     'iedit-mode-on-function          help-map        )
;;   (my-bind-key-with-autoload file   "C-x C-;" 'iedit-rectangle-mode            global-map      )
;;   )

(define-key global-map       (kbd "C-;")     'iedit-mode)          
(define-key isearch-mode-map (kbd "C-;")     'iedit-mode)          
(define-key esc-map          (kbd "C-;")     'iedit-execute-last-modification)
(define-key help-map         (kbd "C-;")     'iedit-mode-on-function)
(define-key global-map       (kbd "C-x C-;") 'iedit-rectangle-mode)

