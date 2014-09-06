;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-emacs-lisp-mode.el
;; ======================================================================
;; * [2011-11-10 木] AddKeywords
;; http://www.emacswiki.org/emacs/AddKeywords
(font-lock-add-keywords 'emacs-lisp-mode
                        '(
                          ("nil" . font-lock-keyword-face)
                          ("kbd" . font-lock-keyword-face)
                          ("define-key" . font-lock-keyword-face)
                          ("add-hook" . font-lock-keyword-face)
                          ("setq" . font-lock-keyword-face)
                          ))
;; ----------------------------------------------------------------------
;; * [2012-06-04 月] n:/download/Emacs/sample_emacs_d/github.com.shishi/shishi-.emacs.d-9d470cf/inits/60-emacs-lisp-mode.el
;; eldoc をミニバッファに表示
;; emacs-lisp-mode-hook用の関数を定義
(defun elisp-mode-hooks ()
  "lisp-mode-hooks"
  (when (require 'eldoc nil t)
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-multiline-p t)
    (turn-on-eldoc-mode)))
;; emacs-lisp-modeのフックをセット
(add-hook 'emacs-lisp-mode-hook 'elisp-mode-hooks)
;; ----------------------------------------------------------------------
;; * [2012-08-09 木] which-func-mode
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (which-function-mode 1)
            ))
;; ----------------------------------------------------------------------
;; * [2013-11-07 木]
(provide 'my-emacs-lisp-mode)
