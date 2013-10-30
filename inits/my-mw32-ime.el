;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;;=============================================================================
;; #+TITLE: .emacs.d／inits／
;; #+LAST_UPDATED: 2011-11-22
;; #-WIKI_UPDATED: 
;; #-WIKI_URL: 
;; usage: (load "~/.emacs.d/inits/my-mw32-ime")
;;
;;-----------------------------------------------------------------------------
;; [2010-11-29 月] 15.3.10 IME に連動してカーソルの色を変える (2004/01/15)
;; cf. url: http://www.bookshelf.jp/soft/meadow_15.html#SEC129
;; ;;ime の ON/OFF でカーソルの色を変える
;; ;;ここから
;; (add-hook 'mw32-ime-on-hook
;;           (function (lambda () (set-cursor-color "SkyBlue"))))
;; (add-hook 'mw32-ime-off-hook
;;           (function (lambda () (set-cursor-color "LemonChiffon"))))
;; (setq-default mw32-ime-mode-line-state-indicator "[--]")
;; ;;モードラインの表示も変更
;; (setq mw32-ime-mode-line-state-indicator-list '("[--]" "[J]" "[--]"))
;; ;;ここまでは mw32-ime-initialize の前に入れる
;; ;; IME の初期化
;; (mw32-ime-initialize)
;; ;; 実行結果 on GNU Emacs 23.2.1 (i386-mingw-nt5.1.2600)
;; ;; Debugger entered--Lisp error: (void-function mw32-ime-initialize)
;; ;; 実行結果 on GNU Emacs 23.3.1 (i386-mingw-nt5.1.2600) of 2011-08-15 on GNUPACK
;; ;; Debugger entered--Lisp error: (void-function mw32-ime-initialize)
;; ;; 仮説 meadow にあるが emacs にない関数か？
;; ----------------------------------------------------------------------
;; [2011-11-22 火] 日本語入力のための設定
;; http://aikotobaha.blogspot.com/2010/08/gnupack-ntemacs23-dotemacs.html

;; 日本語入力のための設定
(set-keyboard-coding-system 'japanese-shift-jis)

;; 標準IMEの設定
(setq default-input-method "W32-IME")

;; IMEの初期化
(w32-ime-initialize)

;; IME OFF時の初期カーソルカラー
(set-cursor-color "red")

;; IME ON/OFF時のカーソルカラー
(add-hook 'input-method-activate-hook
          (lambda() (set-cursor-color "green")))
(add-hook 'input-method-inactivate-hook
          (lambda() (set-cursor-color "red")))

;; バッファ切り替え時にIME状態を引き継ぐ
(setq w32-ime-buffer-switch-p nil)

;; 実行結果 on GNU Emacs 23.3.1 (i386-mingw-nt5.1.2600) of 2011-08-15 on GNUPACK
;; success. 期待通りに動作する。
