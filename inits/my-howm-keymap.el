;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-11-13
;; my-howm-keymap.el
;; ----------------------------------------------------------------------------
(define-key global-map (kbd "C-^ c")   'howm-create)
(define-key global-map (kbd "C-^ G")   'my-howm-view-directory)
(define-key global-map (kbd "C-^ ,")   'howm-menu)
(define-key global-map (kbd "C-^ a")   'howm-list-all)
(define-key global-map (kbd "C-^ l")   'howm-list-recent)
(define-key global-map (kbd "C-^ s")   'howm-list-grep-fixed)
(define-key global-map (kbd "C-^ g")   'howm-list-grep)
;; ----------------------------------------------------------------------
;; * [2012-07-26 木] howm-1.3.9.2
(define-key global-map (kbd "C-^ e")   'howm-remember)
(define-key global-map (kbd "C-^ b")   'howm-list-buffers)
(define-key global-map (kbd "C-^ x")   'howm-list-mark-ring)
(define-key global-map (kbd "C-^ o")   'howm-occur)
(define-key global-map (kbd "C-^ C-t") 'howm-toggle-search-other-dir)
(define-key global-map (kbd "C-^ C-m") 'my-howmM-or-switch-to-buffer)
(define-key global-map (kbd "C-^ C-s") 'my-howmS-or-switch-to-buffer)
;; ----------------------------------------------------------------------
;; comefrome: ~/.emacs.d/inits/my-keymap-basis.el
(message "loaded my-howm-keymap.el")
