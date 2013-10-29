;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; #+LAST_UPDATED: 2013-10-23
;; ----------------------------------------------------------------------
;; * custom
(setq emacs_custom (getenv "EMACS_CUSTOM"))
(setq custom-file (concat "~/.emacs.d/" emacs_custom "/my-emacs-custom.el"))
(load custom-file)
;; ----------------------------------------------------------------------
;; * color
(set-background-color "white")
(set-foreground-color "black")
;; ----------------------------------------------------------------------
;; * org-mode
;; 『Emacs org-modeを使ってみる: (1) インストール - 屯遁のパズルとプログラミングの日記』 http://d.hatena.ne.jp/tamura70/20100203/org
;; キーバインドの設定
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cr" 'org-remember)
;; 拡張子がorgのファイルを開いた時，自動的にorg-modeにする
(add-to-list 'auto-mode-alist '("\\.howm.txt$" . org-mode))
;; ----------------------------------------------------------------------
;; 『起動時間を計測する』 http://d.hatena.ne.jp/sugyan/20120120/1327037494
(add-hook 'after-init-hook
	  (lambda ()
	    (message "init time: %.3f sec"
		     (float-time (time-subtract after-init-time before-init-time)))))
