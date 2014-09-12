;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-search-keybind.el
;; ======================================================================
;; http://www.emacswiki.org/emacs-en/SearchKeybind
(defun my-search-keybind (regexp &optional nlines)
  "Occur search the full list of keybinds & their commands."
   (interactive (occur-read-primary-args))
   (save-excursion
     (describe-bindings)
     (set-buffer "*Help*")
     (occur regexp nlines)
     (delete-windows-on "*Help*")))
;; ----------------------------------------------------------------------
(provide 'my-search-keybind)
;; ----------------------------------------------------------------------
