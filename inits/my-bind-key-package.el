;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-bind-key-package.el
;; ======================================================================
;; * [2014-09-13 土] bind-key.el 導入
;; http://rubikitch.com/tag/emacs-define-key/
;; bind-key* => メジャーモード・マイナーモードに依存しないで常に同じキーに割り当てる
;; ----------------------------------------------------------------------

(when (package-require 'bind-key nil nil t)

  ;; (autoload FUNCTION FILE &optional DOCSTRING INTERACTIVE TYPE)
  ;; (bind-key KEY-NAME COMMAND &optional KEYMAP)
  (defun my-bind-key-with-autoload (FILE KEY-NAME COMMAND &optional KEYMAP)
    "bind-key-with-autoload"
    (autoload COMMAND FILE)
    (bind-key KEY-NAME COMMAND KEYMAP)
    )
  (defun my-bind-key*-with-autoload (FILE KEY-NAME COMMAND &optional KEYMAP)
    "bind-key*-with-autoload"
    (autoload COMMAND FILE)
    (bind-key* KEY-NAME COMMAND KEYMAP)
    )

  ;; bind-key/bind-keysで割り当てたキーバインドをリストする
  (bind-key* "C-h C-x C-p" 'describe-personal-keybindings)

  )

;; ----------------------------------------------------------------------
(provide 'my-bind-key-package)
