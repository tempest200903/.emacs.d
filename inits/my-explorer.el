;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-explorer.el
;; =============================================================================
;; Emacs から エクスプローラを起動するユーティリティ。
(defun my-explorer-current-directory ()
  "Emacs から エクスプローラを起動する。引数：カレントディレクトリ。"
  (interactive)
   (shell-command "cygstart .")
  )
;; ----------------------------------------------------------------------
(provide 'my-explorer)
