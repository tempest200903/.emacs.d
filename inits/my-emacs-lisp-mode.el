;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-emacs-lisp-mode.el
;; ======================================================================
;; 関連 my-emacs-lisp-mode-map.el
;; ----------------------------------------------------------------------
;; * [2011-11-10 木] AddKeywords
;; http://www.emacswiki.org/emacs/AddKeywords
(font-lock-add-keywords 'emacs-lisp-mode
                        '(
                          ("nil" . font-lock-keyword-face)
                          ("kbd" . font-lock-keyword-face)
                          ("define-key" . font-lock-keyword-face)
                          ("add-hook" . font-lock-keyword-face)
                          ("setq" . font-lock-keyword-face)
                          ("package-require" . font-lock-keyword-face)
                          ("require" . font-lock-keyword-face)
                          ("load" . font-lock-keyword-face)
                          ("define-sequential-command" . font-lock-keyword-face)
                          ))
;; ----------------------------------------------------------------------
;; * [2012-06-04 月] n:/download/Emacs/sample_emacs_d/github.com.shishi/shishi-.emacs.d-9d470cf/inits/60-emacs-lisp-mode.el
;; eldoc をミニバッファに表示
;; emacs-lisp-mode-hook用の関数を定義
;; * https://github.com/znz/dot-emacs/blob/8434c73ba833791eedc1411360e10441e52b370e/init.el.d/50elisp.el
;; 
(defun elisp-mode-hooks ()
  "lisp-mode-hooks"
  (hl-line-mode 1)
  (when (require 'eldoc nil t)
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-multiline-p t)
    (turn-on-eldoc-mode))
  )
;; emacs-lisp-modeのフックをセット
(add-hook 'emacs-lisp-mode-hook 'elisp-mode-hooks)
(add-hook 'lisp-interaction-mode-hook 'elisp-mode-hooks)
;; ----------------------------------------------------------------------
;; * [2012-08-09 木] which-func-mode
(defun which-function-mode-on () ""
  (which-function-mode 1)
  )
(add-hook 'emacs-lisp-mode-hook 'which-function-mode-on)
;; ----------------------------------------------------------------------
;; * [2014-09-18 木]
(defun my-eval-buffer-or-region (arg)
  "if mark-active and not current-prefix-arg then eval-region else eval-buffer."
  (interactive "P")
  (if (and mark-active (not current-prefix-arg))
      (eval-region (mark) (point))
    (eval-buffer)
    )
  )

;; ----------------------------------------------------------------------
;; * [2014-09-30 火]

(defun my-debug-on-error-t () "(setq debug-on-error t)"
  (interactive)
  (setq debug-on-error t)
  )

(defun my-debug-on-quit-t () "(setq debug-on-quit t)"
  (interactive)
  (setq debug-on-quit t)
  )

;; Tips. ある関数に対して debug を実行する二番目の方法は、関数を呼び出
;; す時 にデバッグに入る方法である。それには debug-on-entry を使う。

;; ----------------------------------------------------------------------
;; * [2013-11-07 木]
(provide 'my-emacs-lisp-mode)
;; ----------------------------------------------------------------------
