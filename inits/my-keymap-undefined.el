;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-keymap-undefined.el
;; ----------------------------------------------------------------------
;; * [2012-02-09 木] global-map で空いている keybind を表示する。
;; TODO terminal で使用可能か否かを表示する。
(defun my-undefined-key-in-global-map ()
  "global-map で空いている keybind を表示する。"
  (interactive)
  (progn
    (describe-key "C-h C-j")
    (describe-key "C-h C-k")
    (describe-key "C-h C-l")
    (describe-key "C-h C-q")
    (describe-key "C-h C-r")
    (describe-key "C-h C-u")
    (describe-key "C-h C-v")
    (describe-key "C-h C-y")
    (describe-key "C-h C-z")
    (message "上記以外の C-h C-<alpha> は定義済み。")
    (describe-key "M-+")
    (describe-key "C-M-g")
    (describe-key "C-M-z")
    (describe-key "<C-M-backspace>")
    (describe-key "C-z C-z")
    (describe-key "<C-M-attn>")
    (describe-key "C-z C-j")
    (describe-key "C-x C-,")
    (describe-key "C-c C-,")
    (describe-key "M-+")
    (describe-key "C-M-,")
    (describe-key "C-x ?")
    (describe-key "C-z ?")
    (message "? は使わない方がいい？ http://ergoemacs.org/emacs/keyboard_shortcuts.html The question mark ? or any combination with it. (due to emacs technical implementation quirk)")
    (switch-to-buffer-other-window "*Messages*")
    (end-of-buffer nil)
    )
  )
