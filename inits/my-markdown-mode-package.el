;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-markdown-mode-package.el
;; #+LAST_UPDATED: 2013-11-02
;; ======================================================================
;; * [2013-09-17 火] install
;; - M-x package-install markdown-mode
;; - ~/.emacs.d/vendor/elpa/markdown-mode-20130726.2142/markdown-mode.el
;; - http://jblevins.org/projects/markdown-mode/
;; ----------------------------------------------------------------------
;; 関連 my-pandoc-mode-package.el
;; ----------------------------------------------------------------------
(when (and
       (package-require 'markdown-mode nil nil t)
       t)
  (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (add-hook 'markdown-mode 'orgtbl-mode)
  ;; 環境変数 PATH を通しておいて、 (setq markdownf-command "pandoc.exe") にした方がいいか？
  ;;
  ;; pandoc-binary が my-pandoc-mode で定義されているので、 require する。
  (require 'my-pandoc-mode-package)
  (setq markdown-open-command pandoc-binary)
  (markdown-show-version) ;; "markdown-mode, version 2.0"
  )
