;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-expand-region-keymap-autoload.el
;; ======================================================================
;; * [2014-09-14 日] expand-region.el 導入
;; 
(require 'bind-key)

;; default (bind-key "C-M-@" 'mark-sexp)
(bind-key "C-=" 'mark-sexp) 

;; (define-key global-map (kbd "C-M-@") 'er/expand-region)
(bind-key "C-M-@" 'er/expand-region)
(autoload 'er/expand-region "my-expand-region-package" nil t)
