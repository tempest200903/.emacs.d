;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-08-02
;; ----------------------------------------------------------------------
;; [2010-11-22 月] Windows でも Super Hyper キーを使う
;; url: http://www.d4.dion.ne.jp/~usuda/emacs/#EMACS-EL
;; url: http://www.bookshelf.jp/soft/meadow_49.html
;; この方法は失敗した。
;;
;; ----------------------------------------------------------------------
;; [2011-03-10 木] Windows でも Super Hyper キーを使う
;; url: http://xahlee.org/emacs/emacs_hyper_super_keys.html
;; setting the PC keyboard's various keys to
;; Super or Hyper, for emacs running on Windows.
;; (setq w32-pass-lwindow-to-system nil 
;;      w32-pass-rwindow-to-system nil 
;;      w32-pass-apps-to-system nil 
;;      w32-lwindow-modifier 'super ; Left Windows key 
;;      w32-rwindow-modifier 'super ; Right Windows key 
;;      w32-apps-modifier 'hyper) ; Menu key
;; (global-set-key [(super s)] 'save-buffer)
;; (global-set-key [(super o)] 'find-file-at-point)
;; カスタマイズ成功。
;;
;; ----------------------------------------------------------------------
;; * [2011-03-10 木] Windows キーは使えないと不便なので、残しておく。
;; カスタマイズ成功。
;; ** Windows キー
;; (setq w32-pass-lwindow-to-system t
;;       w32-pass-rwindow-to-system t)
;; ** Apps キー
(setq w32-pass-apps-to-system nil 
      w32-apps-modifier 'hyper)
;; 例
;; (global-set-key [(hyper s)] 'save-buffer)
;; (global-set-key [(hyper o)] 'find-file-at-point)
;; ----------------------------------------------------------------------
;; * [2011-08-29 月] capslock キーを super に割り当て可能か？
;; keyboard-translate [oem-attn] ?\C-h)
;; => 失敗。
;; ----------------------------------------------------------------------
;; * [2013-08-02 金] idea 
;; (hyper a)            1回で C-s a
;; (hyper a)            2回で C-s a C-s
;; shift (hyper a)      1回で C-r a
:; 大量に定義するのは面倒。マクロで簡略化できないか？
