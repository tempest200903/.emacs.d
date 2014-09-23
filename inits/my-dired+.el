;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2012-05-21
;; ============================================================
;; * [2011-04-05 火] dired+ install
;; - url: http://xahlee.org/emacs/emacs_diredplus_mode.html
;; - url: http://www.emacswiki.org/emacs/DiredPlus.
;; M-x auto-install-from-emacswiki
;; [[n:/.emacs.d/auto-install/dired+.el]]
(require 'dired+)
;; ------------------------------------------------------------
;; 見た目が変わった。
;; N:\work\y2011\0102WSS\WS-y2011-0367.JPG
;;
;; ファイル名クリックすると、 find-file-other-window . 便利
;; 
;; 他にも大量にコマンド増えた。
;; 数が多い。 C-h a dired の出力を比較する。
;; 導入前 => n:/.emacs.d/memo/dired-before-install.txt
;; 導入後 => n:/.emacs.d/memo/dired-after-install.txt
;; diff => n:/.emacs.d/memo/dired-diff-install.txt
;; 
;; ------------------------------------------------------------
;; * [2011-04-05 火] dired+ cheatsheet
;; It is bound to F, <menu-bar> <operate> <find-files>.
;; (dired-do-find-marked-files &optional ARG)
;; マークしたファイルを全て開く (find-file)
;; ------------------------------------------------------------
;; * [2011-06-13 月]
;; "n:/.emacs.d/auto-install/dired+.el" で定義された
;; (define-key dired-mode-map "\M-g" 'diredp-do-grep)
;; を変更する。
(define-key dired-mode-map "\M-g" nil)
(define-key dired-mode-map (kbd "M-s M-d") 'diredp-do-grep)
;; * [2011-10-25 火] dired-mode で auto-revert-mode を on にする。
(defun turn-on-auto-revert-mode ()
  (interactive)
  (auto-revert-mode 1))
(add-hook 'dired-mode-hook 'turn-on-auto-revert-mode)
;; ----------------------------------------------------------------------
;; * troubleshooting
;; - [2011-11-04 金 11:06] 障害。 ffap で directory を開くと window 分割が解除されてしまう。なぜ？
;;   - いったん、 ffap.el, dired+.el を無効にしてみる。実験中。
;; - [2011-11-29 火 11:01] 今のところ、発生していない。 ffap.el 有効、 dired+.el 無効。原因は dired+.el か？
