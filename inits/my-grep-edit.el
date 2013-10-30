;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-grep-edit.el
;; ======================================================================
;; * [2010-11-04 木] インストール完了。使用開始。
;; cf. テクニックバイブル p.163 grep 検索結果を編集する
;; 使用方法
;; *grep* バッファを編集した後、 C-c C-e (grep-edit.finish-edit) コマンド実行すると変更を反映する。
;; 割と賢い。置換前の文字ケースが大文字なら置換後も大文字になる。
;; ----------------------------------------------------------------------
(when (not (require 'grep-edit nil t))
  (progn
    (install-elisp-from-emacswiki "grep-edit.el")
    )
  )
(when (require 'grep-edit nil t)
  (progn
    (defun my-grep-edit-menu-init ()
      (when (require 'easymenu)
        (easy-menu-add-item nil '("Grep") ["grep-edit-finish-edit" grep-edit-finish-edit t])
        (easy-menu-add-item nil '("Grep") ["grep-edit-remove-change" grep-edit-remove-change t])
        (easy-menu-add-item nil '("Grep") ["grep-edit-remove-all-change" grep-edit-remove-all-change t])
        )
      )
    (add-hook 'grep-mode-hook 'my-grep-edit-menu-init)
    )
  )
