;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; my-init
;; #+LAST_UPDATED: 2013-11-07
;; ----------------------------------------------------------------------
;; * init.el begin
;; ** custom
(setq emacs_custom (getenv "EMACS_CUSTOM"))
(setq custom-file (concat "~/.emacs.d/" emacs_custom "/my-emacs-custom.el"))
(load custom-file)
;; ** load path
(when t    "2013-10-29" (add-to-list 'load-path "~/.emacs.d/manual-install"))
(when t    "2013-11-05" (add-to-list 'load-path "~/.emacs.d/inits"))
;; ----------------------------------------------------------------------
;; * color
(when t    "2013-10-30" (load "~/.emacs.d/inits/my-color"))
;; ----------------------------------------------------------------------
;; * global
(when t    "2013-11-05" (load "~/.emacs.d/inits/my-autoload"))
(when t    "2013-10-29" (load "~/.emacs.d/inits/my-unset-key"))
(when t    "2013-10-29" (load "~/.emacs.d/inits/my-keymap-basis"))
(when t    "2013-10-29" (load "~/.emacs.d/inits/my-setq"))
(when t    "2013-10-29" (load "~/.emacs.d/inits/my-buffer-window-frame"))
(when t    "2013-10-29" (load "~/.emacs.d/inits/my-color-moccur"))
(when t    "2013-10-29" (load "~/.emacs.d/inits/my-os-windows"))
(when t    "2013-10-29" (load "~/.emacs.d/inits/my-picture-mode"))
(when t    "2013-10-29" (load "~/.emacs.d/inits/my-yank-special"))
(when t    "2013-10-30" (load "~/.emacs.d/inits/my-goto-last-change"))
(when t    "2013-10-30" (load "~/.emacs.d/inits/my-kill-ring-save"))
;; (when t    "2013-10-30" (load "~/.emacs.d/inits/my-toggle-truncate-lines")) ;; autoload
(when t    "2013-11-01" (load "~/.emacs.d/inits/my-time-stamp"))
(when t    "2013-11-06" (load "~/.emacs.d/inits/my-popwin"))
(when t    "2013-10-31" (require 'my-occur nil t))                              ;; ~/.emacs.d/inits/my-occur.el
(when t    "2013-11-05" (require 'redo+ nil t))                                 ;; ~/.emacs.d/inits/my-redo.el
;; ----------------------------------------------------------------------
;; * anything
(when t    "2013-10-29" (load "~/.emacs.d/inits/my-anything-basis"))
(when t    "2013-11-01" (load "~/.emacs.d/inits/my-anything-show-buffer"))
;; ----------------------------------------------------------------------
;; * mode specific
;; ** org-mode
(when t    "2013-10-29" (load "~/.emacs.d/inits/my-org-mode-basis"))
(when t    "2013-10-29" (load "~/.emacs.d/inits/my-org-mode-map"))
(when t    "2013-10-29" (load "~/.emacs.d/inits/my-org-speed"))
(when t    "2013-10-29" (load "~/.emacs.d/inits/my-org-hook"))
(when t    "2013-10-29" (load "~/.emacs.d/inits/my-org-mode-hyperlink"))
(when t    "2013-10-30" (load "~/.emacs.d/inits/my-org-mode-isfenv"))
(when t    "2013-10-29" (load "~/.emacs.d/inits/my-workmanager"))
;; ** howm-mode
(when nil  "2013-10-29" (load "~/.emacs.d/inits/my-howm")) ;; [2013-11-07 木] 重たいのでいったん無効にしてみる。
;; ** emacs-lisp-mode
(when t    "2013-11-07" (load "~/.emacs.d/inits/my-emacs-lisp-mode"))
;; ----------------------------------------------------------------------
;; * init.el end
(when t    "2013-10-29" (load "~/.emacs.d/inits/my-benchmark"))
(switch-to-buffer "*Messages*")
