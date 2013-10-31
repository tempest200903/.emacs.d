;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-unset-key.el
;; ----------------------------------------------------------------------
;; * [2011-08-24 水] C-z のキーバインド変更。
;; - デフォルト キーバインド
;;   (repeat)              It is bound to C-x z.
;;   (suspend-frame)       It is bound to C-z, C-x C-z.
;; - suspend-frame => my-buffer-window-frame.el にて別のキーバインド
;; - <f4> kmacro-end-or-call-macro に類似しているので、 <f5> repeat にする。
;; - これで C-z と C-x C-z が空いた。 prefix として使う。
(define-key global-map (kbd "C-t") nil)
(define-key global-map (kbd "C-z") nil)
(define-key global-map (kbd "C-x C-z") nil)
(define-key global-map (kbd "M-+") nil) 
