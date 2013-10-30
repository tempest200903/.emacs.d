;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-auto-highlight-symbol-mode.el
;; ======================================================================
;; * [2012-01-04 水] auto-highlight-symbol-mode.el インストール。
;; http://d.hatena.ne.jp/yuheiomori0718/20111222/1324562208
(if (not (require 'auto-highlight-symbol nil t))
    (auto-install-from-url "https://raw.github.com/mitsuo-saito/auto-highlight-symbol-mode/master/auto-highlight-symbol.el")
  ;; 適用範囲をデフォルトの見えている範囲ではなく buffer 全体に
  (custom-set-variables '(ahs-default-range (quote ahs-range-whole-buffer)))
  (global-auto-highlight-symbol-mode t)
  (defun my-auto-highlight-symbol-mode-tips () ""
    (interactive)
    (message "<tips> my-auto-highlight-symbol-mode-tips")
    (message "<tips> http://d.hatena.ne.jp/yuheiomori0718/20111222/1324562208")
    (message "<tips> M-<left>	ahs-backward	前のシンボルへ移動")
    (message "<tips> M-<right>	ahs-forward	次のシンボルへ移動")
    (message "<tips> M--	ahs-back-to-start	最初のカーソル位置のシンボルへ移動")
    (message "<tips> C-x C-'	ahs-change-range	ハイライトする範囲を表示しているディスプレイの範囲かバッファ全体かを切り替える")
    (message "<tips> C-x C-a	ahs-edit-mode	ハイライトしているシンボルを一括でrenameする")
    (view-echo-area-messages)
    )
  )
;; http://d.hatena.ne.jp/yuheiomori0718/20111222/1324562208
;; ハイライトするまでの時間を変更してみました。デフォルトは1秒です。
;; (ahs-set-idle-interval 0.8)
;; Customize ahs-idle-interval
;; ----------------------------------------------------------------------
;; * [2012-08-09 木] my-auto-highlight-symbol-mode.el から my-highlight-symbol-package.el に移行する？ 検討中。
;; 移行するなら、以下のファイルは不要。削除する。
;; ~/.emacs.d/inits/my-auto-highlight-symbol-mode.el
;; ~/.emacs.d/elisp/highlight-symbol.el
