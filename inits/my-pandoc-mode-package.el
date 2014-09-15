;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2014-09-14
;; my-pandoc-mode-package.el
;; ======================================================================
;; * [2014-09-10 水] install
;; - (package-require 'pandoc-mode nil nil t) を eval する。
;; ----------------------------------------------------------------------
;; 関連 my-markdown-mode-package.el
;; ----------------------------------------------------------------------
(setq userprofile-mixed (replace-regexp-in-string "\\\\" "/" (getenv "USERPROFILE")))
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
  (setq pandoc-binary (concat userprofile-mixed "/AppData/Local/Pandoc/pandoc.exe"))
  ;;
  ;; http://joostkremers.github.io/pandoc-mode/
  (add-hook 'markdown-mode-hook 'turn-on-pandoc)
  (define-key pandoc-mode-map "\C-c/o" 'pandoc--set-output)
  ;;
  (defun my-pandoc-compile-html ()
    ""
    (interactive)
    (compile (my-pandoc-compile-html-command))
    )
  (defun my-pandoc-compile-html-command ()
    ""
    (concat pandoc-binary " -f markdown -t html -o " (buffer-file-name) ".html " (buffer-file-name))
    )
  ;;
  (defun my-pandoc-browse-html ()
    ""
    (interactive)
    (my-pandoc-compile-html)
    (compile (concat (my-pandoc-compile-html-command) " && " (my-pandoc-browse-html-command)))
    )
  (defun my-pandoc-browse-html-command ()
    ""
    (concat "cygstart " (buffer-file-name) ".html ")
    )
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
(provide 'my-pandoc-mode-package)
;; ----------------------------------------------------------------------
