;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-duplicate-thing-package.el
;; ======================================================================
;; * [2012-07-27 金] 現在行や選択範囲を複製する機能
;; - http://d.hatena.ne.jp/syohex/20120325/1332641491
;; 現在行を複製します。選択範囲が指定されている場合は範囲をまるごと複製します。
;; インストール手順 自動
;; (package-install 'duplicate-thing)
(when (not (require 'duplicate-thing nil t))
  (progn
    (message "require duplicate-thing false")
    (when (require 'package nil t)
      (progn
        (package-install 'duplicate-thing)
        )
      )
    )
  )
(when (require 'duplicate-thing nil t)
  (progn
    (message "require duplicate-thing true")
    (global-set-key (kbd "C-z C-w") 'duplicate-thing)
    )
  )
