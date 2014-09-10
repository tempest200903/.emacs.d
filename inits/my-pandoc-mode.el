;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-11-02
;; my-pandoc-mode.el
;; ======================================================================
;; * [2014-09-10 水] install
;; - (package-require 'pandoc-mode nil nil t) を eval する。
;; ----------------------------------------------------------------------
;; 関連 my-markdown-mode.el
;; ----------------------------------------------------------------------
(when (and
       (package-require 'pandoc-mode nil nil t)
       t)
  ;; (add-to-list 'auto-mode-alist '("\\.markdown\\'" . pandoc-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.md\\'" . pandoc-mode))
  ;; (add-hook 'org-mode 'pandoc-mode)
  ;;
  ;; defcustom pandoc-binary を絶対パスで定義しておく必要がある。
  ;; 環境変数 PATH を通してあっても絶対パスが必要。
  ;; TODO 環境変数 PATH から pandoc.exe を探して (setq pandoc-binary xxx) する式をここに書いておけばいいのでは？
  ;; 
  (setq userprofile-mixed (replace-regexp-in-string "\\\\" "/" (getenv "USERPROFILE")))
  (setq pandoc-binary (concat userprofile-mixed "/AppData/Local/Pandoc/pandoc.exe"))
  ;;
  ;; http://joostkremers.github.io/pandoc-mode/
  (add-hook 'markdown-mode-hook 'turn-on-pandoc)
  (define-key pandoc-mode-map "\C-c/o" 'pandoc--set-output)
  )
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
;; ----------------------------------------------------------------------
(provide 'my-pandoc-mode)
;; ----------------------------------------------------------------------
