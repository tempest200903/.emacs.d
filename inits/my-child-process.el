;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-11-09
;; my-child-process.el
;; ======================================================================
;; * [2013-11-09 土] 問題。 M-x shell が失敗する。エラーメッセージは「 Spawning child process: invalid argument  」
;; ** 現象
;; M-x shell が失敗する。
;; エラーメッセージは 
;; apply: Spawning child process: invalid argument
;; ** 対処
;; http://quantumfluctuation.blogspot.jp/2011/06/emacs-shell.html
;; http://www.emacswiki.org/emacs/download/cygwin-mount.el
;; ** インストール手順
;; 下記 progn を eval する。
(when nil
  (progn
    (load "~/.emacs.d/inits/my-auto-install")
    (auto-install-from-url "http://www.emacswiki.org/emacs/download/cygwin-mount.el")
    )
  )
;; ----------------------------------------------------------------------
(require 'cygwin-mount)
(cygwin-mount-activate)

