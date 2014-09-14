;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-auto-install.el
;; ======================================================================
;; * [2011-08-24 水] auto-install インストール手順 install-elisp-from-emacswiki 編
;; url: http://d.hatena.ne.jp/rubikitch/20091221/autoinstall
;; 1. 下記コマンドを実行する。
;; M-x install-elisp-from-emacswiki auto-install.el
;; または (install-elisp-from-emacswiki "auto-install.el")
;; 実体格納場所は ~/.emacs.d/auto-install/auto-install.el
;; ----------------------------------------------------------------------
;; * [2013-10-31 木] auto-install インストール手順 package.el 編
;; M-x package-list-packages auto-install
;; または (package-install 'auto-install)
;; 実体格納場所は ~/.emacs.d/vendor/elpa/auto-install-20130824.1206/auto-install.el
;; ----------------------------------------------------------------------
(when (not (require 'auto-install nil t))
  (package-install 'auto-install)
  )
;; ----------------------------------------------------------------------
(when (require 'auto-install nil t)
  (progn
    ;; ~/.emacs.d/auto-install/ ディレクトリがなければ作る。
    (setq auto-install-directory "~/.emacs.d/auto-install/")
    (unless (file-exists-p auto-install-directory)
      (mkdir auto-install-directory)
      )
    (auto-install-update-emacswiki-package-name t)
    (auto-install-compatibility-setup)
    (add-to-list 'load-path auto-install-directory)
    )
  )
;; ----------------------------------------------------------------------
(provide 'my-auto-install)
;; ----------------------------------------------------------------------
