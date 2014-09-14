;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-visual-regexp-keymap-autoload.el
;; ======================================================================
;; (define-key global-map (kbd "M-s M-v") 'vr/replace)
(bind-key "M-s M-v" 'vr/replace)
(autoload 'vr/replace "my-visual-regexp-package" nil t)

;; (define-key global-map (kbd "M-s M-r") 'vr/query-replace)
(bind-key "M-s M-r" 'vr/query-replace)
(autoload 'vr/query-replace "my-visual-regexp-package" nil t)
