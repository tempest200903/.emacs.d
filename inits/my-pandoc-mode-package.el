;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2014-09-15
;; my-pandoc-mode-package.el
;; 関連 my-pandoc-mode-map.el
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
  ;;
  (defun my-pandoc-compile-markdown-to-html ()
    ""
    (interactive)
    (compile (my-pandoc-compile-markdown-to-html-command))
    )
  (defun my-pandoc-compile-markdown-to-html-command ()
    ""
    (concat pandoc-binary " -f markdown -t html -o " (buffer-file-name) ".html " (buffer-file-name))
    )
  ;;
  (defun my-pandoc-browse-markdown-to-html ()
    ""
    (interactive)
    (my-pandoc-compile-markdown-to-html)
    (compile (concat (my-pandoc-compile-markdown-to-html-command) " && " (my-pandoc-browse-markdown-to-html-command)))
    )
  (defun my-pandoc-browse-markdown-to-html-command ()
    ""
    (concat "cygstart " (buffer-file-name) ".html ")
    )
  ;;
  (defun my-pandoc-compile-org-to-textile ()
    ""
    (interactive)
    (compile (my-pandoc-compile-org-to-textile-command))
    (find-file-other-window (my-pandoc-compile-org-to-textile-output-file-name))
    (balance-windows)
    (revert-buffer t t)
    )
  (defun my-pandoc-compile-org-to-textile-command ()
    ""
    (concat pandoc-binary " -f org -t textile -o " (my-pandoc-compile-org-to-textile-output-file-name) " " (buffer-file-name))
    )
  (defun my-pandoc-compile-org-to-textile-output-file-name ()
    ""
    (concat (buffer-file-name) ".textile")
    )
  ;;
  (load "my-pandoc-mode-map")
  )
;; TODO -f markdown のところを、カレントバッファ名拡張子から自動判別する。
;; ----------------------------------------------------------------------
(provide 'my-pandoc-mode-package)
;; ----------------------------------------------------------------------
