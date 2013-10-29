;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; #+LAST_UPDATED: 2013-10-23
;; ----------------------------------------------------------------------
;; * init.el begin
;; ** custom
(setq emacs_custom (getenv "EMACS_CUSTOM"))
(setq custom-file (concat "~/.emacs.d/" emacs_custom "/my-emacs-custom.el"))
(load custom-file)
;; ----------------------------------------------------------------------
;; * color
;; Emacsの設定 (フォント) http://tcnksm.sakura.ne.jp/blog/2012/04/02/emacs/
(set-background-color "#eeeeee")
(set-foreground-color "black")
;; ----------------------------------------------------------------------
;; * global
(global-unset-key (kbd "C-t"))
(global-unset-key (kbd "C-z"))
(load "~/.emacs.d/inits/my-buffer-window-frame")
(load "~/.emacs.d/inits/my-os-windows")
;; ----------------------------------------------------------------------
;; * mode specific
;; ** org-mode
(load "~/.emacs.d/inits/my-org-mode-basis")
(load "~/.emacs.d/inits/my-org-mode-map")
;; ----------------------------------------------------------------------
;; * init.el end
;; 『起動時間を計測する』 http://d.hatena.ne.jp/sugyan/20120120/1327037494
(add-hook 'after-init-hook
	  (lambda ()
	    (message "init time: %.3f sec"
		     (float-time (time-subtract after-init-time before-init-time)))))
