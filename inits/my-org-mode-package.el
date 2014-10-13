;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-mode-package.el

;; ======================================================================
;; * [2014-10-11 土] Built-in は org-version 7.8.11 。最新版を使う。
;; Built-in org があると、 package-install で自動インストールはできないようだ。
;; 手動ではインストールできる。

(if (eq org-version "7.8.11")
    (package-install 'org)
  )

(message "org-version is {%s}" org-version) ; 8.2.8
