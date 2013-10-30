;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-01-21
;; ======================================================================
;; * [2011-05-16 月] 導入。 
;; Global minor mode to highlight the line about point in the current window.
(global-hl-line-mode 0)
(hl-line-mode 1)
;; ----------------------------------------------------------------------
;; * [2011-10-06 木] face をカスタマイズするには。
;; "n:/tool/emacs-23.2/lisp/hl-line.el"
;; defface hl-line
;; 例: '(hl-line ((t (:underline "MediumBlue"))))
;; hl-line が Background ありだと、 highlight-symbol を隠蔽してしまう。
;; Background なしにしたようがよい。
;; ------------------------------------------------------------
;; http://shibayu36.hatenablog.com/entry/2012/12/29/001418
;; 現在行のハイライト
;; 　emacs使っているとよくカーソルを見失います。そこで現在行のハイライトをしておくと便利です。
;; (defface hlline-face
;;   '((((class color)
;;       (background dark))
;;      (:background "dark slate gray"))
;;     (((class color)
;;       (background light))
;;      (:background  "#98FB98"))
;;     (t
;;      ()))
;;   "*Face used by hl-line.")
;; (setq hl-line-face 'hlline-face)
;; (global-hl-line-mode)
