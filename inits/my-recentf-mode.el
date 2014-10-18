;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-recentf-mode.el
;; ~/.emacs.d/vendor/elpa/recentf-ext-20130130.2150/recentf-ext.el
;; ======================================================================
;; * [2011-08-23 火 15:43] recentf を使う。
;; http://homepage.mac.com/zenitani/elisp-j.html
;; menubar://File/Open Recent が用意される。
;; menubar://File/Open Recent/Options でオプション設定。
(recentf-mode 1)
;; ----------------------------------------------------------------------
;; * [2014-09-26 金] TODO M-x my-rename-file-and-buffer でリネームしたとき、リネーム後のファイル名が recentf に記録されない。
;; ----------------------------------------------------------------------
;; * [2014-09-26 金] http://qiita.com/catatsuy/items/55d50d13ebc965e5f31e
;; 自動保存
;; ----------------------------------------------------------------------
(when (package-require 'recentf-ext)
  ;; (setq recentf-max-saved-items 300) ; M-x customize で指定する。
  ;; (setq recentf-max-menu-items 1)   ; M-x customize で指定する。
  ;; (setq recentf-auto-cleanup 'never)
  (setq recentf-auto-save-timer (run-with-idle-timer 30 t 'recentf-save-list))
  (recentf-mode 1)
  )
