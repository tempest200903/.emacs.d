;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-keymap-superhyper.el
;; #+LAST_UPDATED: 2013-08-02

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

;; ----------------------------------------------------------------------
;; * [2011-03-10 木] Windows キーは使えないと不便なので、残しておく。
;; ** Windows キー
  (progn
    (setq w32-pass-lwindow-to-system t)
    (setq w32-pass-rwindow-to-system t)
    (setq w32-lwindow-modifier 'super)
    (setq w32-rwindow-modifier 'super)
    )
;; ** Apps キー
(setq w32-pass-apps-to-system nil 
      w32-apps-modifier 'hyper)

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

;; ----------------------------------------------------------------------
;; * [2014-09-28 日] 実験 lwindow
(when nil
  (progn
    (define-key global-map (kbd "<s-tab>") 'next-multiframe-window)
    )
  )

