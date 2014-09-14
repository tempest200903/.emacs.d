;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-visible-mark.el
;; ======================================================================
;; * [2011-09-07 水] インストール方法1
;; url: http://www.emacswiki.org/emacs/VisibleMark
;; - M-x auto-install-from-emacswiki visible-mark.el
;; (auto-install-from-emacswiki "visible-mark.el") 
;; これだと emacs 起動時に障害がある。
;; ----------------------------------------------------------------------
;; * [2014-09-13 土] インストール方法2
;; (package-install 'visible-mark)
;; これだとなぜか失敗する。
;; ----------------------------------------------------------------------
;; フェイスをカスタマイズしたい場合 → (describe-face 'visible-mark-face)
;; ----------------------------------------------------------------------
;; * [2014-09-14 日] 故障するので使用中止。
(when nil 
  (progn
    (when (not (require 'visible-mark nil t))
      (progn
        (auto-install-from-url "https://gitlab.com/iankelling/visible-mark/raw/master/visible-mark.el")
        )
      )
    (when (require 'visible-mark nil t)
      (progn
        (global-visible-mark-mode 1)
        )
      )
    )
