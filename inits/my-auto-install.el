;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-auto-install.el
;; ======================================================================
;; * [2011-08-24 水] auto-install インストール手順
;; url: http://d.hatena.ne.jp/rubikitch/20091221/autoinstall
;; 1. 下記 elisp を実行する。
;; 2. 自動的に ~/.emacs.d/auto-install/ ディレクトリが作られる。
;; ----------------------------------------------------------------------
;; * [2013-10-31 木] auto-install インストール手順
;; M-x package-list-packages auto-install
(when (not (require 'auto-install nil t))
  (message "require package false")
  (package-install "auto-install")
  ;; [2014-09-06 土] なぜか (package-install "auto-install") で自動インストールはできなかった。
  ;; 手動でインストールした。 M-x package-install RET auto-install
  ;; ~/.emacs.d/vendor/elpa/auto-install-20130824.1206/auto-install.el
  )
(when (require 'auto-install nil t)
  (progn
    (setq auto-install-directory "~/.emacs.d/auto-install/")
    (unless (file-exists-p auto-install-directory)
      (mkdir auto-install-directory)
      )
    (auto-install-update-emacswiki-package-name t)
    (auto-install-compatibility-setup)
    )
  )
;; ----------------------------------------------------------------------
(provide 'my-auto-install)
;; ----------------------------------------------------------------------
