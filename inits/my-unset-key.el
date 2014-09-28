;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-unset-key.el
;; ----------------------------------------------------------------------
;; my-keymap-basis.el をリロードすると再度 unset してしまうのを防ぐため、
;; unset 関連を別ファイルに独立させる。
;; ----------------------------------------------------------------------
;; * [2011-08-24 水] 
(define-key global-map (kbd "C-^") nil)           ;; my-howm.el
(define-key global-map (kbd "C-t") nil)           ;; my-keymap-basis.el
(define-key global-map (kbd "C-z") nil)           ;; my-keymap-basis.el ;; default (repeat) 
(define-key global-map (kbd "C-q") nil)           ;; my-keymap-basis.el ;; default (quoted-insert)
(define-key global-map (kbd "C-x C-z") nil)       ;; my-keymap-basis.el ;; default (suspend-frame)
(define-key global-map (kbd "M-+") nil)           ;; ??
(define-key global-map (kbd "C-x m") nil)         ;; my-magit.el ;; default (compose-mail)
(define-key global-map (kbd "<non-convert>") nil) ;; my-lookup-key.el

;; ----------------------------------------------------------------------
;; * [2012-11-16 金] diff-mode では M-g に revert-buffer が割り当てられていて邪魔だ。 <S-F1> を使う。
;; (add-hook 'diff-mode-hook
;;           (lambda ()
;;             (define-key diff-mode-map (kbd "M-g") nil)
;;             ))
(define-key diff-mode-map (kbd "M-g") nil)
