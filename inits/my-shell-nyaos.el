;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-shell-nyaos.el
;; #+LAST_UPDATED: 2014-09-28
;; ======================================================================
(defun shell-nyaos () "shell using nyaos"
  (interactive)
  (let* ((explicit-shell-file-name "C:/tool/nyaos/nyaos.exe"))
    (call-interactively 'shell)
    )
  )
;; 実験中。失敗する。
;; c:\tool\nyaos\nyaos.exe : -i: No such option

(when nil
  (progn
    ;; https://pikacode.com/troter/home/file/38742708264a/.emacs.d/initialize/nyaos.el
    (defun tr:use-nyaos ()
    ;;; WindowsNT に付属の CMD.EXE を使う場合。
    (setq explicit-shell-file-name "CMDPROXY.EXE")
    (setq shell-file-name "CMDPROXY.EXE")
    (setq shell-command-switch "\\/c")

    ;;; nyaosを利用する場合 暫定版
    (setq nyaos.exe "C:\\tool\\nyaos\\nyaos.exe")
    (when nyaos.exe
      (setq explicit-shell-file-name nyaos.exe
            shell-file-name explicit-shell-file-name
            shell-command-switch ""
            explicit-nyaos.exe-args '()
            shell-file-name-chars "~/A-Za-z0-9_^$!#%&{}@`'.,:()-")
      ))
    )
  )
