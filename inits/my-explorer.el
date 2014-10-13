;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-explorer.el
;; TODO DRY my-os-windows-explorer.el
;; =============================================================================
;; Emacs から エクスプローラを起動するユーティリティ。

(defun current-directory ()
  (file-name-directory (buffer-file-name))
  )

(defun my-explorer-current-directory ()
  "Emacs から エクスプローラを起動する。引数：カレントディレクトリ。"
  (interactive)
  (if (shell-command "cygstart .")
      (message "my-explorer-current-directory succeeded with shell-command.")
    (if (w32-shell-execute "open" (current-directory))
        (message "my-explorer-current-directory succeeded with w32-shell-execute.")
      (message "my-explorer-current-directory failed.")
      )
    )
  )

;; ** [2014-10-09 木] TODO w32-shell-execute と shell-command どちらがいいのか？
;; それぞれ、失敗したことがある。失敗条件は分からない。
;; とりあえず、両方トライしてみる。
;; ----------------------------------------------------------------------
(provide 'my-explorer)
