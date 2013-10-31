;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; #+LAST_UPDATED: 2013-10-23
;; ----------------------------------------------------------------------
;; * init.el begin
;; ** custom
(setq emacs_custom (getenv "EMACS_CUSTOM"))
(setq custom-file (concat "~/.emacs.d/" emacs_custom "/my-emacs-custom.el"))
(load custom-file)
;; ** load path
(add-to-list 'load-path "~/.emacs.d/inits")
;; ----------------------------------------------------------------------
;; * color
(when "2013-10-30" (load "~/.emacs.d/inits/my-color"))
;; ----------------------------------------------------------------------
;; * global
(when "2013-10-29" (load "~/.emacs.d/inits/my-unset-key"))
(when "2013-10-29" (load "~/.emacs.d/inits/my-keymap-basis"))
(when "2013-10-29" (load "~/.emacs.d/inits/my-setq"))
(when "2013-10-29" (load "~/.emacs.d/inits/my-buffer-window-frame"))
(when "2013-10-29" (load "~/.emacs.d/inits/my-color-moccur"))
(when "2013-10-29" (load "~/.emacs.d/inits/my-os-windows"))
(when "2013-10-29" (load "~/.emacs.d/inits/my-picture-mode"))
(when "2013-10-29" (load "~/.emacs.d/inits/my-copy-line"))
(when "2013-10-29" (load "~/.emacs.d/inits/my-yank-special"))
(when "2013-10-30" (load "~/.emacs.d/inits/my-goto-last-change"))
(when "2013-10-30" (load "~/.emacs.d/inits/my-kill-ring-save"))
(when "2013-10-30" (load "~/.emacs.d/inits/my-toggle-truncate-lines"))
(when "2013-10-30" (load "~/.emacs.d/inits/my-redo"))
;; ----------------------------------------------------------------------
;; * anything
(when "2013-10-29" (load "~/.emacs.d/inits/my-anything-basis"))
(when "2013-10-30" (load "~/.emacs.d/inits/my-anything-c-static-keywords"))
;; ----------------------------------------------------------------------
;; * mode specific
;; ** org-mode
(when "2013-10-29" (load "~/.emacs.d/inits/my-org-mode-basis"))
(when "2013-10-29" (load "~/.emacs.d/inits/my-org-mode-map"))
(when "2013-10-29" (load "~/.emacs.d/inits/my-org-speed"))
(when "2013-10-29" (load "~/.emacs.d/inits/my-org-hook"))
(when "2013-10-29" (load "~/.emacs.d/inits/my-org-mode-buffer"))
(when "2013-10-29" (load "~/.emacs.d/inits/my-org-mode-hyperlink"))
(when "2013-10-29" (load "~/.emacs.d/inits/my-workmanager"))
(when "2013-10-30" (load "~/.emacs.d/inits/my-org-mode-isfenv"))
;; ** howm-mode
(when "2013-10-29" (load "~/.emacs.d/inits/my-howm"))
;; ----------------------------------------------------------------------
;; * init.el end
(when "2013-10-29" (load "~/.emacs.d/inits/my-benchmark"))
