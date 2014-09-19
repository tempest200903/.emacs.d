;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-coding-system.el
;; ======================================================================
;; * [2014-09-19 金] cf. Emacs 実践入門 p.85
(set-language-environment "Japanese")
;; ~/.emacs.d/memo/describe-current-coding-system1.txt ... (set-language-environment "Japanese") する前
;; ~/.emacs.d/memo/describe-current-coding-system2.txt ... (set-language-environment "Japanese") した後
;; M-x describe-variable RET language-info-alist RET
;; * [2014-09-19 金] cf. Emacs 実践入門 p.86
(setq locale-coding-system 'cp932)
;; ----------------------------------------------------------------------
;; * [2014-09-08 月] ~/.emacs.d/gnupack-init.el
;; 日本語入力のための設定
(set-keyboard-coding-system 'cp932)
(prefer-coding-system 'utf-8-dos)
(set-file-name-coding-system 'cp932)
(setq default-process-coding-system '(cp932 . cp932))
;; ----------------------------------------------------------------------
;; * [2014-09-13 土] TODO (set-language-environment "Japanese") すると何が変わる？
;; https://github.com/nanasess/dot.emacs/blob/master/init.d/japanese-init.el
;; ----------------------------------------------------------------------
;; * [2011-11-22 火] エンコード
;; http://aikotobaha.blogspot.com/2010/08/gnupack-ntemacs23-dotemacs.html
;; cp932エンコード時の表示を「P」とする
(coding-system-put 'cp932 :mnemonic ?P)
(coding-system-put 'cp932-dos :mnemonic ?P)
(coding-system-put 'cp932-unix :mnemonic ?P)
(coding-system-put 'cp932-mac :mnemonic ?P)
