;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-keymap-undefined.el
;; ----------------------------------------------------------------------
;; * [2012-02-09 木] global-map で空いている keybind を表示する。
;; TODO terminal で使用可能か否かを表示する。

(defun my-undefined-key-in-global-map ()
  "global-map で空いている keybind を表示する。"
  (interactive)
  (progn
    (message "C-h C-j => %s" (key-binding (kbd "C-h C-j")))
    (message "C-h C-k => %s" (key-binding (kbd "C-h C-k")))
    (message "C-h C-l => %s" (key-binding (kbd "C-h C-l")))
    (message "C-h C-q => %s" (key-binding (kbd "C-h C-q")))
    (message "C-h C-r => %s" (key-binding (kbd "C-h C-r")))
    (message "C-h C-u => %s" (key-binding (kbd "C-h C-u")))
    (message "C-h C-v => %s" (key-binding (kbd "C-h C-v")))
    (message "C-h C-y => %s" (key-binding (kbd "C-h C-y")))
    (message "C-h C-z => %s" (key-binding (kbd "C-h C-z")))
    (message "上記以外の C-h C-<alpha> は定義済み。")
    (message "M-+ => %s" (key-binding (kbd "M-+")))
    (message "C-M-g => %s" (key-binding (kbd "C-M-g")))
    (message "C-M-z => %s" (key-binding (kbd "C-M-z")))
    (message "<C-M-backspace> => %s" (key-binding (kbd "<C-M-backspace>")))
    (message "C-z C-z => %s" (key-binding (kbd "C-z C-z")))
    (message "<C-M-attn> => %s" (key-binding (kbd "<C-M-attn>")))
    (message "C-z C-j => %s" (key-binding (kbd "C-z C-j")))
    (message "C-x C-, => %s" (key-binding (kbd "C-x C-,")))
    (message "C-c C-, => %s" (key-binding (kbd "C-c C-,")))
    (message "M-+ => %s" (key-binding (kbd "M-+")))
    (message "C-M-, => %s" (key-binding (kbd "C-M-,")))
    (message "C-x ? => %s" (key-binding (kbd "C-x ?")))
    (message "C-z ? => %s" (key-binding (kbd "C-z ?")))
    (message "? は使わない方がいい？ http://ergoemacs.org/emacs/keyboard_shortcuts.html The question mark ? or any combination with it. (due to emacs technical implementation quirk)")
    (message "C-M-j => %s" (key-binding (kbd "C-M-j")))
    (message "M-j => %s" (key-binding (kbd "M-j")))
    (message "indent-new-comment-line C-M-j M-j 片方は要らない。")
    (message "C-x <up> => %s" (key-binding (kbd "C-x <up>")))
    (message "C-x <down> => %s" (key-binding (kbd "C-x <down>")))
    (message "<C-non-convert> <C-non-convert> => %s" (key-binding (kbd "<C-non-convert> <C-non-convert>")))
    (message "M-g M-w => %s" (key-binding (kbd "M-g M-w")))
    (message "C-x / => %s" (key-binding (kbd "C-x /")))
    (message "M-s M-q M-s => %s" (key-binding (kbd "M-s M-q M-s")))
    (message "M-s M-q M-r => %s" (key-binding (kbd "M-s M-q M-r")))
    (switch-to-buffer-other-window "*Messages*")
    (end-of-buffer nil)
    (recenter-top-bottom nil)
    )
  )

;; M-o facemenu-keymap
;; いくつか空きがある。 occur 系列をここに入れるか？
