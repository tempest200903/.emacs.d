;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-lookup-key.el
;; ======================================================================

(global-set-key (kbd "<non-convert> x") (lookup-key global-map (kbd "C-x")))
;; 使用例 (global-set-key (kbd "C-x f") (kbd "<non-convert> f")

(global-set-key (kbd "<non-convert> c") (lookup-key global-map (kbd "C-c")))
;; 使用例 (global-set-key (kbd "C-c l") (kbd "<non-convert> c l")

(global-set-key (kbd "<non-convert> t") (lookup-key global-map (kbd "C-t")))
;; 使用例 (global-set-key (kbd "C-t b") (kbd "<non-convert> t b")

(global-set-key (kbd "<non-convert> z") (lookup-key global-map (kbd "C-z")))
;; 使用例 (global-set-key (kbd "C-z b") (kbd "<non-convert> z b")

(global-set-key (kbd "<C-non-convert>") (lookup-key global-map (kbd "C-x 5")))
;; 使用例 (global-set-key (kbd "C-x 5 C-f") (kbd "<C-non-convert> C-f")

;; <C-copy> は Ctrl+ひらがな のこと。
(global-set-key (kbd "<C-copy>") (lookup-key global-map (kbd "C-x 4")))
;; 使用例 (global-set-key (kbd "C-x 4 C-f") (kbd "<C-copy> C-f")

(global-set-key (kbd "<C-convert>") (lookup-key global-map (kbd "M-s M-q")))
;; 使用例 (global-set-key (kbd "M-s M-q M-s") (kbd "<C-convert> M-s")

(global-set-key (kbd "<S-convert>") (lookup-key global-map (kbd "C-x r")))
;; 使用例 (global-set-key (kbd "C-x r s") (kbd "<S-convert> s")

;; TODO [2014-09-28 日]
;; http://www.emacswiki.org/PrefixKey
;; bluewind を <S-non-convert> に移す。
;; <C-non-convert>  C-* で C-x C-*
;; <C-convert>      C-* で C-t C-*
;; <C-oem-attn>     C-* で C-t C-*
;; とした方が楽。
;;
;; bluewind/Users/%USER%/bluewind.ini を編集する。
;; Call_key=29
;; Call_Mod=2
;; Call_S=Ctrl+無変換
;; を
;; Call_key=29
;; Call_Mod=4
;; Call_S=Shift+無変換
;; に書き換える。

;; TODO [2014-09-28 日]
;; ----------------------------------------------------------------------
;; * [2014-09-28 日] (kbd "<non-convert>") を有効利用する。
;; (define-prefix-command 'my-non-convert-map)
;; (global-set-key (kbd "<non-convert>") 'my-non-convert-map)
;; (define-key my-non-convert-map (kbd "s") 'save-buffer)
;; このようにして keymap を増やすという手もある。

