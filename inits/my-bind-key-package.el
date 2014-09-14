;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-bind-key-package.el
;; ======================================================================
;; * [2014-09-13 土] bind-key.el 導入
;; http://rubikitch.com/tag/emacs-define-key/
;; bind-key* => メジャーモード・マイナーモードに依存しないで常に同じキーに割り当てる
;; ----------------------------------------------------------------------
(package-require 'bind-key nil nil t)
;; ----------------------------------------------------------------------
;; bind-key/bind-keysで割り当てたキーバインドをリストする
;; (define-key global-map (kbd "C-h C-x C-p") 'describe-personal-keybindings)
(bind-key* "C-h C-x C-p" 'describe-personal-keybindings)
(autoload 'describe-personal-keybindings "my-loccur-package" nil t)
;; ----------------------------------------------------------------------
(provide 'my-bind-key-package)
