;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-point-undo-keymap-autoload.el
;; ======================================================================
;; (define-key global-map (kbd "M-g M-b") 'point-undo)
(bind-key "M-g M-b" 'point-undo)
(autoload 'point-undo "my-point-undo-package" nil t)

;; (define-key global-map (kbd "M-g M-f") 'point-redo)
(bind-key "M-g M-f" 'point-redo)
(autoload 'point-redo "my-point-undo-package" nil t)
;; ----------------------------------------------------------------------
