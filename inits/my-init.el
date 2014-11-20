;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; my-init.el
;; #+LAST_UPDATED: 2014-10-11
;; ----------------------------------------------------------------------
;; * benchmark
(when t "2014-09-14" (load "~/.emacs.d/inits/my-benchmark"))
;; ----------------------------------------------------------------------
;; * load path
(add-to-list 'load-path "~/.emacs.d/inits")
;; ----------------------------------------------------------------------
;; * load
;; package を利用するファイルより先に load する必要がある。
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-package"))
;; auto-install を利用するファイルより先に load する必要がある。
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-auto-install"))
;;
(when t    "2014-11-02" (load "~/.emacs.d/inits/my-idle-require"))
;; ----------------------------------------------------------------------
;; * custom
(load "~/.emacs.d/inits/my-custom-file")
;; ----------------------------------------------------------------------
;; * global
;; define-key よりさきに unset-key する必要がある。
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-unset-key"))
;; define-key を含むので unset-key より後ろに配置する。
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-autoload"))
;; M-x shell に必要。
(when t    "2014-10-13" (load "~/.emacs.d/inits/my-child-process"))
;; occur したあと org-open-at-point すると window が3つになる。このとき occur window 占有面積が広すぎる。
(when t    "2014-10-15" (load "~/.emacs.d/inits/my-popwin-package"))

(when t    "2014-09-08" (load "~/.emacs.d/inits/my-coding-system"))
(when t    "2014-10-11" (load "~/.emacs.d/inits/my-recentf-mode"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-keymap-basis"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-buffer-window-frame"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-setq"))
(when t    "2014-10-09" (load "~/.emacs.d/inits/my-child-process")) ; M-x compile するために必要！

;; ないと不便。 load my-os-windows-ime にした直後に別フレームに入力が移るバグ発生。これが原因か！？
(when nil  "2014-10-23" (load "~/.emacs.d/inits/my-os-windows-ime"))
(when nil  "2014-10-23" (load "~/.emacs.d/inits/my-ime-indicator"))

;; (when t    "2014-10-05" (load "~/.emacs.d/inits/my-accesslog")) ; 実験中。 psession を使うと起動に時間がかかる。
(when nil  "2014-10-05" (my-idle-require "my-accesslog")) ; 実験中。 psession を使うと起動に時間がかかる。

(when nil  "2014-10-13" (load "~/.emacs.d/inits/my-mode-line")) ;; 実験中

(when nil  "2014-09-06" (load "~/.emacs.d/inits/my-redo"))
(when nil  "2014-09-06" (load "~/.emacs.d/inits/my-goto-last-change"))
(when nil  "2014-09-06" (load "~/.emacs.d/inits/my-emacs-server")) ; workmanager_time_collect.bat から戻ってくるときに使う。 DropFile.exe を使えば不要。
(when nil  "2014-09-11" (load "~/.emacs.d/inits/my-japanese-holidays-package"))
(when nil  "2014-09-13" (load "~/.emacs.d/inits/my-point-undo-package")) ;; 実験中
(when nil  "2014-09-09" (load "~/.emacs.d/inits/my-markdown-mode-package")) ;; 実験中
(when nil  "2014-09-08" (load "~/.emacs.d/inits/my-visible-mark")) ;; 故障するので使用中止。
(when nil  "2014-09-06" (load "~/.emacs.d/inits/my-migemo")) ;; 実験中。
(when nil  "2014-09-06" (load "~/.emacs.d/inits/my-color"))
(when nil  "2014-09-26" (load "~/.emacs.d/inits/my-sequential-command")) ;; 実験中
(when nil  "2014-09-20" (load "~/.emacs.d/inits/my-calc")) ;; 実験中
(when nil  "2014-09-23" (load "~/.emacs.d/inits/my-shell")) ;; 実験中
(when nil  "2014-09-22" (load "~/.emacs.d/inits/my-os-windows-explorer")) ;; 実験中
(when nil  "2014-09-26" (load "~/.emacs.d/inits/my-textile-mode-package")) ;; 実験中
(when nil  "2014-09-26" (load "~/.emacs.d/inits/my-foreign-regexp")) ;; 実験中
(when nil  "2014-09-27" (load "~/.emacs.d/inits/my-uniquify")) ;; 実験中
(when nil  "2014-09-27" (load "~/.emacs.d/inits/my-hiwin")) ;; 実験中
(when nil  "2014-09-28" (load "~/.emacs.d/inits/my-auto-complete-package")) ;; 実験中
(when nil  "2014-10-10" (load "~/.emacs.d/inits/my-iswitchb")) ;; 実験中

;; ----------------------------------------------------------------------
;; * anything
;; (when t    "2013-10-29" (load "~/.emacs.d/inits/my-anything-basis"))
;; (when t    "2013-11-01" (load "~/.emacs.d/inits/my-anything-show-buffer"))
;; ----------------------------------------------------------------------
;; * mode specific
;; ** org-mode
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-org-mode-basis"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-org-mode-map"))
(when t    "2014-09-06" (require 'my-org-mode-dn2 nil t) "~/.emacs.d/inits/my-org-mode-dn2")
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-org-clock"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-org-hook"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-org-speed"))
(when t    "2014-10-16" (load "~/.emacs.d/inits/my-org-countdown")) ; 軽い。

;; (when t    "2014-10-11" (load "~/.emacs.d/inits/my-org-agenda-holidays")) ; 実験中
   (when t    "2014-10-11" (my-idle-require "my-org-agenda-holidays")) ; 実験中

(when t  "2014-11-12" (load "~/.emacs.d/inits/my-org-capture")) ; 実験中

(when nil  "2014-09-26" (load "~/.emacs.d/inits/my-org-clone-subtree")) ;; 実験中
(when nil  "2014-10-18" (load "~/.emacs.d/inits/my-org-mode-hilight")) ; 実験中
;; ** emacs-lisp-mode
(when nil  "2014-09-06" (load "~/.emacs.d/inits/my-emacs-lisp-mode"))
(when nil  "2014-09-30" (load "~/.emacs.d/inits/my-show-paren-mode")) ;; 実験中
;; ----------------------------------------------------------------------
;; * [2014-09-25 木] 実験中。
;; http://d.hatena.ne.jp/ramen26/20101202/1291294660
;; emacs の表示が崩れる。。。
(menu-bar-mode -1)

(cua-selection-mode -1)
;; ----------------------------------------------------------------------
