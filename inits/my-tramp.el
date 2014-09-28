;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-tramp.el
;; #+LAST_UPDATED: 2014-09-28
;; ======================================================================
;; * [2014-09-28 日]
;; http://admnote.paix.jp/2014/07/meadow%E3%81%8B%E3%82%89emacs-for-windows%E3%81%AB%E7%A7%BB%E8%A1%8C/
;; tramp の設定
;;
;; http://kubotahi.blogspot.jp/2011/04/emacs-tramp.html
;; Windows(Windows7)の場合
;;
;; http://stackoverflow.com/questions/18915477/emacs-windows-tramp-plink-still-doesnt-work
;; 

(require 'tramp)

;; 環境変数にplinkへのパスを追加する。
(setenv "PATH"
        (concat
         "C:\\tool\\putty;"
         (getenv "PATH")
         ;; ";C:\\Chocolatey\\lib\\putty.portable.0.63\\tools"
         )
        )

(setq-default tramp-default-method "plink")
(setq tramp-default-method "plink")

;; 実験
;; (find-file "/ssh:vagrant@192.168.33.15:/home/vagrant/")
;; (find-file "/plink:vagrant@192.168.33.15:/home/vagrant/")


;; 失敗
;; Unable to open connection:
;; Debugger entered--Lisp error: (file-error "Process died")
;;   signal(file-error ("Process died"))
;;   byte-code ...
;;   tramp-file-name-handler(expand-file-name "/ssh:vagrant@192.168.33.15/home/vagrant/" nil)
;;   expand-file-name("/ssh:vagrant@192.168.33.15/home/vagrant/")
;;   find-file-noselect("/ssh:vagrant@192.168.33.15/home/vagrant/" nil nil nil)
;;   find-file("/ssh:vagrant@192.168.33.15/home/vagrant/")
