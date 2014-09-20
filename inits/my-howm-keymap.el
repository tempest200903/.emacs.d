;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2014-09-20
;; my-howm-keymap.el
;; ----------------------------------------------------------------------------
;; * [2014-09-20 土] VERIFY autoload
(require 'my-bind-key-package)
;; ----------------------------------------------------------------------------
;; * [2011-07-26 火] howm バージョン不明
;; (define-key global-map (kbd "C-^ c")   'howm-create)
;; (define-key global-map (kbd "C-^ G")   'my-howm-view-directory)
;; (define-key global-map (kbd "C-^ ,")   'howm-menu)
;; (define-key global-map (kbd "C-^ a")   'howm-list-all)
;; (define-key global-map (kbd "C-^ l")   'howm-list-recent)
;; (define-key global-map (kbd "C-^ s")   'howm-list-grep-fixed)
;; (define-key global-map (kbd "C-^ g")   'howm-list-grep)
;; (define-key global-map (kbd "C-^ d")   'howm-insert-date)

(my-bind-key-with-autoload "my-howm"  (kbd "C-^ c")   'howm-create)
(my-bind-key-with-autoload "my-howm"  (kbd "C-^ G")   'my-howm-view-directory)
(my-bind-key-with-autoload "my-howm"  (kbd "C-^ ,")   'howm-menu)
(my-bind-key-with-autoload "my-howm"  (kbd "C-^ a")   'howm-list-all)
(my-bind-key-with-autoload "my-howm"  (kbd "C-^ l")   'howm-list-recent)
(my-bind-key-with-autoload "my-howm"  (kbd "C-^ s")   'howm-list-grep-fixed)
(my-bind-key-with-autoload "my-howm"  (kbd "C-^ g")   'howm-list-grep)
(my-bind-key-with-autoload "my-howm"  (kbd "C-^ d")   'howm-insert-date)
;; ----------------------------------------------------------------------
;; * [2012-07-26 木] howm-1.3.9.2
;; (define-key global-map (kbd "C-^ e")   'howm-remember)
;; (define-key global-map (kbd "C-^ b")   'howm-list-buffers)
;; (define-key global-map (kbd "C-^ x")   'howm-list-mark-ring)
;; (define-key global-map (kbd "C-^ o")   'howm-occur)
;; (define-key global-map (kbd "C-^ C-t") 'howm-toggle-search-other-dir)
;; (define-key global-map (kbd "C-^ C-m") 'my-howmM-or-switch-to-buffer)
;; (define-key global-map (kbd "C-^ C-s") 'my-howmS-or-switch-to-buffer)

(my-bind-key-with-autoload "my-howm"  (kbd "C-^ e")   'howm-remember)
(my-bind-key-with-autoload "my-howm"  (kbd "C-^ b")   'howm-list-buffers)
(my-bind-key-with-autoload "my-howm"  (kbd "C-^ x")   'howm-list-mark-ring)
(my-bind-key-with-autoload "my-howm"  (kbd "C-^ o")   'howm-occur)
(my-bind-key-with-autoload "my-howm"  (kbd "C-^ C-t") 'howm-toggle-search-other-dir)
(my-bind-key-with-autoload "my-howm"  (kbd "C-^ C-m") 'my-howmM-or-switch-to-buffer)
(my-bind-key-with-autoload "my-howm"  (kbd "C-^ C-s") 'my-howmS-or-switch-to-buffer)
;; ----------------------------------------------------------------------
;; comefrome: ~/.emacs.d/inits/my-keymap-basis.el
(message "loaded my-howm-keymap.el")
;; ----------------------------------------------------------------------
