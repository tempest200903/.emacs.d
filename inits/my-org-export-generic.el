;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-09-05
;; ======================================================================
(add-to-list 'load-path "n:/download/Emacs/plugin/org-export-generic/org-mode-91056e2.tar/org-mode-91056e2/contrib/lisp")
(load "n:/download/Emacs/plugin/org-export-generic/org-mode-91056e2.tar/org-mode-91056e2/contrib/lisp/org-export.el")
(load "N:/download/Emacs/plugin/org-export-generic/org-mode-91056e2.tar/org-mode-91056e2/contrib/lisp/org-export-generic.el")
(define-key org-mode-map (kbd "C-z C-c C-e") 'org-export-generic)
