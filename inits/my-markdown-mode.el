;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-11-02
;; my-markdown-mode.el
;; ======================================================================
;; * [2013-09-17 火] install
;; - M-x package-install markdown-mode
;; - ~/.emacs.d/vendor/elpa/markdown-mode-20130726.2142/markdown-mode.el
;; - http://jblevins.org/projects/markdown-mode/
;; ----------------------------------------------------------------------
(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
;; ----------------------------------------------------------------------
(setq markdown-command "c:/Users/nakamura/AppData/Local/Pandoc/pandoc.exe")
