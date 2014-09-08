;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-bm-package.el
;; =============================================================================
;; インストール手順
;; M-x package-list-packages bm を選択して install ボタンをクリックする。
;; または M-x package-install bm
;; または この式を評価する。
(dolist (package '(bm))
  (unless (package-installed-p package)
    (package-install package)))
;; cf. http://emacs-jp.github.io/packages/package-management/package-el.html
;; ----------------------------------------------------------------------
(when (require 'bm nil t)
  (progn
    (message "require package true")
    )
  )
;; ----------------------------------------------------------------------
;; - 長所。emacs 標準付属の bookmark-set コマンドではできないことができる。
;;   - 非ファイルバッファを bookmark する。
;; - 使い方
;;   - M-x bm-toggle ブックマーク トグル
;;   - M-x bm-next 次のブックマークへジャンプ
;;   - M-x bm-previous 前のブックマークへジャンプ
;;   - M-x bm-bookmark-regexp 正規表現にマッチする行を全てブックマークする
;;   - bm-cycle-all-buffers t にすると 全てのバッファを巡回する。 
;; TODO C-u M-x bm-next で一時的に t にするコマンドを作る。
;; ----------------------------------------------------------------------
;; * [2012-05-31 木] customize
;; (setq bm-buffer-persistence t) ;; *Specify if bookmarks in a buffer should be persistent.
;; ----------------------------------------------------------------------
(provide 'my-bm-package)
;; ----------------------------------------------------------------------
