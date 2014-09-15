;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-buffer-window-frame.el
;; buffer, window, frame 関連のユーティリティ。
;; TODO global-set-key と他を分離する。 autoload する。
;; ============================================================
;; * [2011-11-09 水] フレームのデフォルト値を変更する
;; 新規フレームのデフォルト設定
(setq default-frame-alist
      (quote
       (
        (menu-bar-lines . 1)
        (vertical-scroll-bars. left)
        (tool-bar-lines . 0)
        (left . 0)
        (top . 10)
        (height . 60)
        (width . 190)
        )))
;; 初期フレームの設定
(setq initial-frame-alist
      (quote
       (
        (menu-bar-lines . 1)
        (vertical-scroll-bars. left)
        (tool-bar-lines . 0)
        (left . 1)
        (top . 10)
        (height . 40)
        (width . 150)
        )))
;; ------------------------------------------------------------
;; * [2011-08-23 火] other-window, other-frame の逆順を使いたい
;; - http://www.fan.gr.jp/~ring/Meadow/meadow.html#previous-window
(defun other-window-minus (arg) ""
  (interactive "p")
  (other-window (- arg))
  )
(defun other-frame-minus (arg) ""
  (interactive "p")
  (other-frame (- arg))
  )
;; ------------------------------------------------------------
;; * [2011-08-24 水] 最小化したフレームをアクティブにする。
(defun raise-other-frame (arg) ""
  (interactive "p")
  (raise-frame (next-frame (selected-frame)))
  )
(defun raise-other-frame-minus (arg) ""
  (interactive "p")
  (raise-frame (previous-frame (selected-frame)))
  )
;; ------------------------------------------------------------
;; * [2011-12-14 水] 直前のバッファに切り換えるコマンド。
;; http://d.hatena.ne.jp/rubikitch/20111211/smalldisplay
;;; last-buffer
(defvar last-buffer-saved nil)
;; last-bufferで選択しないバッファを設定
(defvar last-buffer-exclude-name-regexp
  (rx (or "*Completions*" "*Org Export/Publishing Help*"
          (regexp "^ "))))
(defun record-last-buffer ()
  (when (and (one-window-p)
             (not (eq (window-buffer) (car last-buffer-saved)))
             (not (string-match last-buffer-exclude-name-regexp
                                (buffer-name (window-buffer)))))
    (setq last-buffer-saved
          (cons (window-buffer) (car last-buffer-saved)))))
(add-hook 'window-configuration-change-hook 'record-last-buffer)
(defun switch-to-last-buffer ()
  "直前のバッファに切り換えるコマンド"
  (interactive)
  (condition-case nil
      (switch-to-buffer (cdr last-buffer-saved))
    (error (switch-to-buffer (other-buffer)))))
(global-set-key (kbd "<S-f7>") 'switch-to-last-buffer)
(global-set-key (kbd "C-z b") 'switch-to-last-buffer)
;; ------------------------------------------------------------
;; * [2011-08-22 月] 旧キー割り当て体系
;; Ctrl         + %   => window 操作
;; Shift        + %   => buffer 操作
;; Alt          + %   => frame 操作
;; %            + F3  => make
;; %            + F4  => delete
;; %            + F5  => previous
;; %            + F6  => next
;; ** window
(global-set-key (kbd "<C-f1>") 'delete-other-windows) ;; C-x 1 の alias.
(global-set-key (kbd "C-t C-1") 'delete-other-windows) ;; C-x 1 の alias.
(global-set-key (kbd "<C-f2>") 'split-window-vertically) ;; C-x 2 の alias.
(global-set-key (kbd "C-t C-2") 'split-window-vertically) ;; C-x 2 の alias.
(global-set-key (kbd "<C-f3>") 'split-window-horizontally) ;; C-x 3 の alias.
(global-set-key (kbd "C-t C-3") 'split-window-horizontally) ;; C-x 3 の alias.
(global-set-key (kbd "<C-f4>") 'delete-window)
(global-set-key (kbd "C-t C-4") 'delete-window) ;; C-x 0 の alias.
(global-set-key (kbd "<C-f5>") 'previous-multiframe-window)
(global-set-key (kbd "C-t C-5") 'previous-multiframe-window)
(global-set-key (kbd "<C-f6>") 'next-multiframe-window)
(global-set-key (kbd "C-t C-6") 'next-multiframe-window)
(global-set-key (kbd "<C-f7>") 'fit-window-to-buffer)
(global-set-key (kbd "C-t C-7") 'fit-window-to-buffer)
(global-set-key (kbd "<C-f8>") 'tabbar-backward-tab)
(global-set-key (kbd "C-t C-8") 'tabbar-backward-tab)
(global-set-key (kbd "<C-f9>") 'tabbar-forward-tab)
(global-set-key (kbd "C-t C-9") 'tabbar-forward-tab)

;; emacs-nw では function key を使えないので。実験中。
(global-set-key (kbd "C-z C-f") 'next-multiframe-window)
(global-set-key (kbd "C-z C-b") 'previous-multiframe-window)
(global-set-key (kbd "C-z C-n") 'raise-other-frame-minus)
(global-set-key (kbd "C-z C-p") 'raise-other-frame)
;; C-t C-f などと二重定義になっている。不要な方を削除するべし。

;; ** buffer
(global-set-key (kbd "<S-f1>") 'revert-buffer)
(global-set-key (kbd "C-x <S-f1>") 'recover-this-file)
(global-set-key (kbd "<S-f2>") 'revert-buffer-with-coding-system) ;; C-x RET r の alias.
(global-set-key (kbd "<S-f3>") 'rename-uniquely) ;; M-s u の alias.
(global-set-key (kbd "<S-f4>") 'kill-buffer) ;; C-x k の alias.
(global-set-key (kbd "<S-f5>") 'previous-buffer) ;; C-x <left> の alias.
(global-set-key (kbd "<S-f6>") 'next-buffer) ;; C-x <right> の alias.
(global-set-key (kbd "C-z C-x C-b") 'bs-show)
;; ** frame
;; <M-f1> => my-os-windows.el (my-frame-maximize)
(global-set-key (kbd "<M-f2>") 'speedbar)
(global-set-key (kbd "<M-f3>") 'make-frame-command) ;; C-x 5 2 の alias.
;; (global-set-key (kbd "C-t C-3") 'make-frame-command) ;; C-x 5 0 の alias.
(global-set-key (kbd "<M-f4>") 'delete-frame) ;; C-x 5 0 の alias.
;; (global-set-key (kbd "C-t C-4") 'delete-frame) ;; C-x 5 0 の alias.

(global-set-key (kbd "<M-f5>") 'raise-other-frame-minus)
(global-set-key (kbd "<M-f6>") 'raise-other-frame)
(global-set-key (kbd "<M-f7>") 'suspend-frame)
(global-set-key (kbd "C-t C-z") 'suspend-frame) ;; emacs-nw では function key を使えないので。実験中。

;; ------------------------------------------------------------
;; * [2012-05-23 水] 新キー割り当て体系
;; emacs terminal では function key を利用できないことを考慮する。
;; Ctrl         + %   => window 操作
;; Shift        + %   => buffer 操作
;; Alt          + %   => frame 操作
;; %            + F3  => make
;; %            + F4  => delete
;; %            + F5  => previous
;; %            + F6  => next
;; ** window
;; (global-set-key (kbd "<C-f1>") 'delete-other-windows) ;; C-x 1 の alias.
;; (global-set-key (kbd "<C-f2>") 'split-window-vertically) ;; C-x 2 の alias.
;; (global-set-key (kbd "<C-f3>") 'split-window-horizontally) ;; C-x 3 の alias.
;; (global-set-key (kbd "<C-f4>") 'delete-window) ;; C-x 0 の alias.
;; (global-set-key (kbd "<C-f5>") 'previous-multiframe-window)
;; (global-set-key (kbd "<C-f6>") 'next-multiframe-window)
;; (global-set-key (kbd "<C-f7>") 'fit-window-to-buffer)
;; ;; ** buffer
;; (global-set-key (kbd "<S-f1>") 'revert-buffer)
;; (global-set-key (kbd "C-x <S-f1>") 'recover-this-file)
;; (global-set-key (kbd "<S-f2>") 'revert-buffer-with-coding-system) ;; C-x RET r の alias.
;; (global-set-key (kbd "<S-f3>") 'rename-uniquely) ;; M-s u の alias.
;; (global-set-key (kbd "<S-f4>") 'kill-buffer) ;; C-x k の alias.
;; (global-set-key (kbd "<S-f5>") 'previous-buffer) ;; C-x <left> の alias.
;; (global-set-key (kbd "<S-f6>") 'next-buffer) ;; C-x <right> の alias.
;; (global-set-key (kbd "C-z C-x C-b") 'bs-show)
;; ;; ** frame
;; (global-set-key (kbd "<M-f2>") 'speedbar)
;; (global-set-key (kbd "<M-f3>") 'make-frame-command) ;; C-x 5 2 の alias.
;; (global-set-key (kbd "<M-f4>") 'delete-frame) ;; C-x 5 0 の alias.
;; (global-set-key (kbd "<M-f5>") 'raise-other-frame-minus)
;; (global-set-key (kbd "<M-f6>") 'raise-other-frame)
;; (global-set-key (kbd "<M-f7>") 'suspend-frame)

(when (require 'my-os-windows nil t)
  (global-set-key (kbd "<M-f12>") 'my-frame-maximize)
  (global-set-key (kbd "<M-f11>") 'my-resize-frame)
  (global-set-key (kbd "<M-f10>") 'my-maximize-frame)
  (global-set-key (kbd "<M-f9>") 'my-restore-current-frame)
  )
;; ----------------------------------------------------------------------
;; [2012-06-01 金] other-window に作用する shrink-window-if-larger-than-buffer
(defun my-shrink-other-window-if-larger-than-buffer ()
  "apply shrink-window-if-larger-than-buffer to other window"
  (interactive)
  (other-window 1)
  (shrink-window-if-larger-than-buffer)
  (other-window -1)
)
(global-set-key (kbd "C-z -") 'my-shrink-other-window-if-larger-than-buffer)
;; ----------------------------------------------------------------------
(defun my-reset-frame ()
  "フォントが崩れてしまう不具合を解消するため、フレームを作り直す"
  (interactive)
  (call-interactively 'make-frame-command)
  (call-interactively 'delete-frame)
)
;; ----------------------------------------------------------------------
;; [2014-09-06] (set-background-color), (set-foreground-color) が戻ってしまう。
;; ウィンドウ分割が解除されてしまう。
;; (define-key global-map (kbd "<S-non-convert>") 'my-reset-frame) 
;; ----------------------------------------------------------------------
;; [2014-09-06] フォントが戻ってしまう。
;; (define-key global-map (kbd "<S-non-convert>") 'color-theme-emacs-21) 
;; ----------------------------------------------------------------------
(define-key global-map (kbd "<S-non-convert>") 'color-theme-vim-colors)
