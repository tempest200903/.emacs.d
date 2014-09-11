;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-redmine.el
;; ======================================================================
;; * [2014-09-11 木] インストール
;; http://d.hatena.ne.jp/gongoZ/20110712/1310399781
;; https://github.com/gongo/org-redmine
;; (package-install 'org-redmine)
;; ----------------------------------------------------------------------
;; * [2014-09-11 木] 設定
(when (and
       (package-require 'org-redmine nil nil t)
       t)
  (setq org-redmine-uri "http://211.17.181.228/redmine/")
  (setq org-redmine-auth-username (getenv "org-redmine-auth-username"))
  (setq org-redmine-auth-password (getenv "org-redmine-auth-password"))
  (message "org-redmine enabled")
  )
;; ----------------------------------------------------------------------
;; usage
;; M-x org-redmine-get-issue
;; apply: Searching for program: no such file or directory, curl
;; [2014-09-11 木 19:43] curl が必要？
;; $ which curl
;; /cygdrive/c/Q/Git/bin/curl
