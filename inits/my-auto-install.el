;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-08-24 水] auto-install を導入する。
;; ** インストール手順
;; url: http://d.hatena.ne.jp/rubikitch/20091221/autoinstall
;; 1. 下記 elisp を実行する。
;; 2. 自動的に ~/.emacs.d/auto-install/ ディレクトリが作られる。
;;
(when (not (require 'auto-install nil t))
  (progn
    (install-elisp-from-emacswiki "auto-install.el")
    )
  )
;;
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
