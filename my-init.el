;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; my-init.el
;; #+LAST_UPDATED: 2014-09-05
;; ----------------------------------------------------------------------
;; * load path
;; (when t    "2013-10-29" (add-to-list 'load-path "~/.emacs.d/manual-install"))
(when t    "2014-09-06" (add-to-list 'load-path "~/.emacs.d/inits"))
;; (when t    "2013-11-09" (add-to-list 'load-path "~/.emacs.d/elpa/anything-20130606.946"))
;; ----------------------------------------------------------------------
;; ** custom
(setq emacs_custom (getenv "EMACS_CUSTOM"))
(setq custom-file (concat "~/.emacs.d/" emacs_custom "/my-emacs-custom.el"))
(load custom-file)
;; ----------------------------------------------------------------------
;; * global
(when t    "2014-09-08" (load "~/.emacs.d/inits/my-coding-system"))
;; define-key よりさきに unset-key する必要がある。
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-unset-key"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-keymap-basis"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-buffer-window-frame"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-autoload"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-setq"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-package"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-auto-install"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-child-process"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-redo"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-goto-last-change"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-popwin"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-emacs-server"))
;; (when t    "2013-10-29" (load "~/.emacs.d/inits/my-os-windows"))
;; (when nil  "2013-10-29" (load "~/.emacs.d/inits/my-picture-mode"))
;; (when t    "2014-04-15" (load "~/.emacs.d/inits/my-time-stamp"))
(when t    "2014-09-09" (load "~/.emacs.d/inits/my-recentf-mode"))
(when t    "2014-09-11" (load "~/.emacs.d/inits/my-japanese-holidays-package"))
(when t    "2014-09-09" (load "~/.emacs.d/inits/my-markdown-mode-package")) ;; 実験中
(when t    "2014-09-08" (load "~/.emacs.d/inits/my-dired-mode-map")) ;; 実験中
(when t    "2014-09-08" (load "~/.emacs.d/inits/my-mw32-ime")) ;; 実験中
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-migemo"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-color"))
;; ----------------------------------------------------------------------
;; * anything
;; (when t    "2013-10-29" (load "~/.emacs.d/inits/my-anything-basis"))
;; (when t    "2013-11-01" (load "~/.emacs.d/inits/my-anything-show-buffer"))
;; ----------------------------------------------------------------------
;; * mode specific
;; ** org-mode
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-org-mode-basis"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-org-mode-map"))
(when t    "2014-09-06" (require 'my-org-mode-dn2 nil t) "~/.emacs.d/inits/my-org-mode-dn2")
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-org-clock"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-org-hook"))
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-org-speed"))
;; ** howm-mode
(when t    "2014-09-08" (load "~/.emacs.d/inits/my-howm-keymap"))
;; ** emacs-lisp-mode
(when t    "2014-09-06" (load "~/.emacs.d/inits/my-emacs-lisp-mode-map"))
;; (when t    "2014-04-11" (load "~/.emacs.d/inits/my-emacs-lisp-mode"))
;; ----------------------------------------------------------------------
;; * require after init
;; (when t    "2013-12-05" (load "~/.emacs.d/inits/my-require-interactive")) ;; homw など重い lisp を遅延評価するため必要。
;; ----------------------------------------------------------------------
;; * init.el end
;; (when nil  "2013-10-29" (load "~/.emacs.d/inits/my-benchmark"))
;; ----------------------------------------------------------------------
