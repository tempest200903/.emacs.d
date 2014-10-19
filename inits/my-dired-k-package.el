;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-dired-k-package.el
;; 関連 my-dired-k-keymap-autoload.el

;; ======================================================================
;; * DONE [2014-10-19 日]
;; - http://rubikitch.com/2014/10/19/dired-k/
;; - emacs dired-k.el : dired/direxでサイズ・最終更新時刻・git statusで色をつける | MELPA Emacs Lisp Elisp パッケージ インストール 設定 使い方 スクリーンショット | るびきち「日刊Emacs」
;; - ファイルサイズ, 最終更新時刻, gitの状態(コミットされた・変更済み・管理されていない) でそれぞれ色をつけてくれます。
;; - diredのgは本来再描画ですが、dired-kに割り当てれば再描画＋色付けをしてくれるので便利です。


;; ----------------------------------------------------------------------
;; ~/.emacs.d/vendor/elpa/dired-k-20141013.651/dired-k.el

(when (require 'my-package nil t)
  (if (package-require 'dired-k nil nil t)
      (progn
        (message "package-require success.")
        )
    (message "package-require fail.")
    )
  )

