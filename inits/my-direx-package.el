;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-direx-package.el
;; 関連 my-direx-keymap-autoload.el

;; ======================================================================
;; * DONE [2014-10-19 日]
;; - http://rubikitch.com/2014/10/18/direx/
  ;; - emacs direx.el : diredとspeedbarを組み合わせた全く新しいファイラ | MELPA Emacs Lisp Elisp パッケージ インストール 設定 使い方 スクリーンショット | るびきち「日刊Emacs」

;; ----------------------------------------------------------------------
;; ~/.emacs.d/vendor/elpa/direx-20140323.908/direx.el

(when (require 'my-package nil t)
  (if (package-require 'direx nil nil t)
      (progn
        (message "package-require success.")
        )
    (message "package-require fail.")
    )
  )


