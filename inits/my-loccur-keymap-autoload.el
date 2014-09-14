;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-loccur-keymap-autoload.el
;; ======================================================================
(require 'my-bind-key-package)

;; (define-key global-map (kbd "M-s M-l M-c") 'loccur-current)
(bind-key "M-s M-l M-c" 'loccur-current)
(autoload 'loccur-current "my-loccur-package" nil t)

;; (define-key global-map (kbd "M-s M-l M-l") 'loccur)
(bind-key "M-s M-l M-l" 'loccur)
(autoload 'loccur "my-loccur-package" nil t)

;; (define-key global-map (kbd "M-s M-l M-p") 'loccur-previous-match)
(bind-key "M-s M-l M-p" 'loccur-previous-match)
(autoload 'loccur-previous-match "my-loccur-package" nil t)

;; (define-key global-map (kbd "M-s M-l M-d") 'loccur-defun)
(bind-key "M-s M-l M-d" 'loccur-defun)
(autoload 'loccur-defun "my-loccur-package" nil t)

;; (define-key global-map (kbd "M-s M-l M-t") 'loccur-toggle-highlight)
(bind-key "M-s M-l M-t" 'loccur-toggle-highlight)
(autoload 'loccur-toggle-highlight "my-loccur-package" nil t)
