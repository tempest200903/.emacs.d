;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-bind-key-package.el
;; ======================================================================
;; * [2014-09-13 土] bind-key.el 導入
;; http://rubikitch.com/tag/emacs-define-key/
;; bind-key* => メジャーモード・マイナーモードに依存しないで常に同じキーに割り当てる
;; 
;; 使用例
;; (global-set-key (kbd "C-c x") 'my-ctrl-c-x-command)
;; ↓
;; (bind-key "C-c x" 'my-ctrl-c-x-command)
;; (define-key some-other-mode-map (kbd "C-c x") 'my-ctrl-c-x-command)
;; ↓
;; (bind-key "C-c x" 'my-ctrl-c-x-command some-other-mode-map)
;; ----------------------------------------------------------------------

(when (package-require 'bind-key nil nil t)

  ;; (autoload FUNCTION FILE &optional DOCSTRING INTERACTIVE TYPE)
  ;; (bind-key KEY-NAME COMMAND &optional KEYMAP)
  ;; TODO describe-personal-keybindings 実行するとエラー発生。 KEYMAP1 の指定方法に問題ありそう。
  (defun my-bind-key-with-autoload (FILE KEY-NAME COMMAND &optional KEYMAP1)
    "bind-key-with-autoload"
    (autoload COMMAND FILE)
    (if KEYMAP1
          (bind-key KEY-NAME COMMAND KEYMAP1)
      (bind-key KEY-NAME COMMAND global-map)
      )
    )
  (defun my-bind-key*-with-autoload (FILE KEY-NAME COMMAND &optional KEYMAP1)
    "bind-key*-with-autoload"
    (autoload COMMAND FILE)
    (if KEYMAP1
        (bind-key* KEY-NAME COMMAND KEYMAP1)
      (bind-key* KEY-NAME COMMAND )
      )
    )

  ;; bind-key/bind-keysで割り当てたキーバインドをリストする
  (bind-key* "C-h C-x C-p" 'describe-personal-keybindings)

  )

;; ----------------------------------------------------------------------
(provide 'my-bind-key-package)
