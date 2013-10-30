;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-11-10 木 18:06] generic 導入
(require 'generic-x)
(setq auto-mode-alist (append (list
                               '("\\.bat$" . bat-generic-mode)
                               '("\\.ini$" . ini-generic-mode)
                               auto-mode-alist)))
;; [2011-11-11 金] error 発生する。原因不明。とりあえず無効にする。 init.el が完了したあと手動で load すると error 発生しない。
;; File mode specification error: (wrong-type-argument stringp ("\\.[rR][uU][lL]\\'" . rul-generic-mode)) [12 times]
;; if: Agenda file n:/howm/2011/11/2011-11-02-095536-0000000000000000.howm.txt is not in `org-mode'
