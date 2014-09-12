;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-loccur.el
;; ======================================================================
;; * [2014-09-13 土] loccur.el 導入
;; http://www.emacswiki.org/emacs/OccurMode
;; https://github.com/fourier/loccur
;; ----------------------------------------------------------------------
;; sample
;; (require 'loccur)
;; ;; defines shortcut for loccur of the current word
;; (define-key global-map [(control o)] 'loccur-current)
;; ;; defines shortcut for the interactive loccur command
;; (define-key global-map [(control meta o)] 'loccur)
;; ;; defines shortcut for the loccur of the previously found word
;; (define-key global-map [(control shift o)] 'loccur-previous-match)
;; ----------------------------------------------------------------------
(when (and
       (package-require 'loccur nil nil t)
       t)
  (when (require 'my-use-package nil t)
    (use-package loccur
      :config (progn
               (defun loccur-defun()
                 "Displays only the lines corresponding to a defun declaration in a lisp file."
                 (interactive)
                 (loccur-no-highlight ".*defun.*"))
               )
      :bind (
             ("M-s M-l M-c" . loccur-current)           ;; autoload 付き (define-key global-map (kbd "M-s M-l M-c") 'loccur-current)
             ("M-s M-l M-l" . loccur)                   ;; autoload 付き (define-key global-map (kbd "M-s M-l M-l") 'loccur)
             ("M-s M-l M-p" . loccur-previous-match)    ;; autoload 付き (define-key global-map (kbd "M-s M-l M-p") 'loccur-previous-match)
             ("M-s M-l M-d" . loccur-defun)             ;; autoload 付き (define-key global-map (kbd "M-s M-l M-d") 'loccur-defun)
             ("M-s M-l M-t" . loccur-toggle-highlight)  ;; autoload 付き (define-key global-map (kbd "M-s M-l M-t") 'loccur-toggle-highlight)
             )
      )
    )
  )
