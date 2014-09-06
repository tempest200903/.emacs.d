;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; my-init
;; #+LAST_UPDATED: 2014-09-05
;; ----------------------------------------------------------------------
(delete-selection-mode -1)
;; ----------------------------------------------------------------------
;; * init.el begin
;; ** custom
(setq emacs_custom (getenv "EMACS_CUSTOM"))
(setq custom-file (concat "~/.emacs.d/" emacs_custom "/my-emacs-custom.el"))
(load custom-file)
;; ** load path
;; (when t    "2013-10-29" (add-to-list 'load-path "~/.emacs.d/manual-install"))
;; (when t    "2013-11-05" (add-to-list 'load-path "~/.emacs.d/inits"))
;; (when t    "2013-11-09" (add-to-list 'load-path "~/.emacs.d/elpa/anything-20130606.946"))
;; ----------------------------------------------------------------------
;; * globalunset-key する必要がある。
;; define-key よりさきに
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-unset-key"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-keymap-basis"))
;; (when t    "2014-09-06" (load "~/.emacs.d/inits/my-buffer-window-frame"))
;; (when t    "2014-04-15" (load "~/.emacs.d/inits/my-emacs-server"))
;; (when t    "2013-11-09" (load "~/.emacs.d/inits/my-auto-install"))
;; (when t    "2013-11-05" (load "~/.emacs.d/inits/my-autoload"))
;; (when t    "2013-11-09" (load "~/.emacs.d/inits/my-child-process"))
;; (when t    "2013-10-29" (load "~/.emacs.d/inits/my-setq")) ;; ないと基本動作が変わってしまうので必須。
;; (when nil  "2013-10-29" (load "~/.emacs.d/inits/my-color-moccur"))
;; (when t    "2013-10-29" (load "~/.emacs.d/inits/my-os-windows"))
;; (when nil  "2013-10-29" (load "~/.emacs.d/inits/my-picture-mode"))
;; (when t    "2014-01-09" (load "~/.emacs.d/inits/my-goto-last-change"))
;; (when t    "2013-10-30" (load "~/.emacs.d/inits/my-kill-ring-save"))
;; (when t    "2014-04-15" (load "~/.emacs.d/inits/my-time-stamp"))
;; (when t    "2013-11-06" (load "~/.emacs.d/inits/my-popwin"))
;; (when t    "2013-10-31" (load "~/.emacs.d/inits/my-occur"))
;; (when t    "2013-11-05" (load "~/.emacs.d/inits/my-redo")) ;; auto-load では手遅れ。
;; ----------------------------------------------------------------------
;; * color
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-color"))
;; ----------------------------------------------------------------------
;; * anything
;; (when t    "2013-10-29" (load "~/.emacs.d/inits/my-anything-basis"))
;; (when t    "2013-11-01" (load "~/.emacs.d/inits/my-anything-show-buffer"))
;; ----------------------------------------------------------------------
;; * mode specific
;; ** org-mode
;; (when t    "2013-10-29" (load "~/.emacs.d/inits/my-org-mode-basis"))
;; (when t    "2013-10-29" (load "~/.emacs.d/inits/my-org-mode-map"))
;; (when t    "2013-10-29" (load "~/.emacs.d/inits/my-org-speed"))
;; (when t    "2013-10-29" (load "~/.emacs.d/inits/my-org-hook"))
;; (when nil  "2013-10-29" (load "~/.emacs.d/inits/my-org-mode-hyperlink")) ;; auto-load
;; (when (file-readable-p "~/.emacs.d/inits/my-org-mode-dn2.el") "2013-10-30" (load "~/.emacs.d/inits/my-org-mode-dn2"))
;; (when t    "2013-10-29" (load "~/.emacs.d/inits/my-timemanager"))
;; ** howm-mode
;; (when t    "2014-01-07" (load "~/.emacs.d/inits/my-howm-keymap"))
;; ** emacs-lisp-mode
;; (when t    "2014-04-11" (load "~/.emacs.d/inits/my-emacs-lisp-mode"))
;; ----------------------------------------------------------------------
;; * require after init
;; (when t    "2013-12-05" (load "~/.emacs.d/inits/my-require-interactive")) ;; homw など重い lisp を遅延評価するため必要。
;; ----------------------------------------------------------------------
;; * init.el end
;; (when nil  "2013-10-29" (load "~/.emacs.d/inits/my-benchmark"))
;; ----------------------------------------------------------------------
