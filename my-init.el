;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; my-init.el
;; #+LAST_UPDATED: 2014-09-25
;; ----------------------------------------------------------------------
;; * benchmark
 (when t "2014-09-14" (load "~/.emacs.d/inits/my-benchmark"))
;; ----------------------------------------------------------------------
;; * load path
;; (when t    "2013-10-29" (add-to-list 'load-path "~/.emacs.d/manual-install"))
(when t    "2014-09-06" (add-to-list 'load-path "~/.emacs.d/inits"))
;; (when t    "2013-11-09" (add-to-list 'load-path "~/.emacs.d/elpa/anything-20130606.946"))
;; ----------------------------------------------------------------------
;; ** custom
(setq emacs_custom (getenv "EMACS_CUSTOM"))
(setq custom-file (concat "~/.emacs.d/" emacs_custom "/my-emacs-custom.el"))
(load custom-file)
;; ----------------------------------------------------------------------
;; * global
;; package を利用するファイルより先に load する必要がある。
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-package"))
;; auto-install を利用するファイルより先に load する必要がある。
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-auto-install"))
(when t    "2014-09-08" (load "~/.emacs.d/inits/my-coding-system"))
;; define-key よりさきに unset-key する必要がある。
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-unset-key"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-buffer-window-frame"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-autoload"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-setq"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-child-process"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-redo"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-goto-last-change"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-popwin-package"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-emacs-server"))
(when t    "2014-09-09" (load "~/.emacs.d/inits/my-recentf-mode"))
(when t    "2014-09-11" (load "~/.emacs.d/inits/my-japanese-holidays-package"))
(when nil  "2014-09-13" (load "~/.emacs.d/inits/my-point-undo-package")) ;; 実験中
(when nil  "2014-09-09" (load "~/.emacs.d/inits/my-markdown-mode-package")) ;; 実験中
(when nil  "2014-09-08" (load "~/.emacs.d/inits/my-visible-mark")) ;; 故障するので使用中止。
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-migemo")) ;; 実験中。
(when t    "2014-09-08" (load "~/.emacs.d/inits/my-os-windows-ime")) ;; 実験中。
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-color"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-keymap-basis"))
(when t    "2014-09-16" (load "~/.emacs.d/inits/my-sequential-command")) ;; 実験中
(when nil  "2014-09-20" (load "~/.emacs.d/inits/my-calc")) ;; 実験中
(when t    "2014-09-23" (load "~/.emacs.d/inits/my-shell")) ;; 実験中
(when t    "2014-09-22" (load "~/.emacs.d/inits/my-os-windows-explorer")) ;; 実験中
(when t    "2014-09-26" (load "~/.emacs.d/inits/my-foreign-regexp")) ;; 実験中
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
(when t    "2014-09-19" (load "~/.emacs.d/inits/my-org-countdown")) ;; 実験中
(when t    "2014-09-26" (load "~/.emacs.d/inits/my-org-clone-subtree")) ;; 実験中
;; ** howm-mode
(when t    "2014-09-08" (load "~/.emacs.d/inits/my-howm-keymap"))
;; ** emacs-lisp-mode
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-emacs-lisp-mode-map"))
;; ----------------------------------------------------------------------
;; * require after init
;; (when t    "2013-12-05" (load "~/.emacs.d/inits/my-require-interactive")) ;; homw など重い lisp を遅延評価するため必要。
;; ----------------------------------------------------------------------
;; * [2014-09-25 木] 実験中。
;; http://d.hatena.ne.jp/ramen26/20101202/1291294660
;; emacs の表示が崩れる。。。
(menu-bar-mode -1)
;; ----------------------------------------------------------------------
