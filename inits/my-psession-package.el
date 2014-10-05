;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-psession-package.el

;; ======================================================================
;; * [2014-10-05 日]
;; http://rubikitch.com/2014/08/21/psession/
;; Emacsのデータ・バッファ・ウィンドウ構成を永続化(保存)し、再起動時に復元する方法 | psession MELPA Emacs Lisp Elisp パッケージ インストール 設定 使い方 永続化 | るびきち「日刊Emacs」
;; 保存される場所は ~/.emacs.d/elisp-objects/ です。
;; 保存する変数は psession-object-to-save-alist で設定します。

(when (package-require 'psession)
  (psession-mode 1)
)

(provide 'my-psession-package)
