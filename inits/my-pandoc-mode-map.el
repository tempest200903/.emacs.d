;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2014-09-15
;; my-pandoc-mode-map.el
;; 関連 my-pandoc-mode-package.el
;; ======================================================================
;; (define-key pandoc-mode-map "\C-c/o" 'pandoc--set-output)
(bind-key "C-c / o" 'pandoc--set-output pandoc-mode-map)
(bind-key "C-c / h" 'my-pandoc-compile-markdown-to-html pandoc-mode-map)
(bind-key "C-c / b" 'my-pandoc-browse-markdown-to-html pandoc-mode-map)
;; ----------------------------------------------------------------------
;; cheat sheet
;; define-key デフォルト設定。
;; (define-key map "\C-c/c" 'pandoc-insert-@)
;; (define-key map "\C-c/C" 'pandoc-select-@)
;; (define-key map "\C-c/m" 'pandoc-set-metadata)
;; (define-key map "\C-c/p" 'pandoc-convert-to-pdf)
;; (define-key map "\C-c/r" 'pandoc-run-pandoc)
;; (define-key map "\C-c/s" 'pandoc-save-settings-file)
;; (define-key map "\C-c/S" 'pandoc-view-settings)
;; (define-key map "\C-c/v" 'pandoc-set-variable)
;; (define-key map "\C-c/V" 'pandoc-view-output)
;; (define-key map "\C-c/w" 'pandoc-set-write)
