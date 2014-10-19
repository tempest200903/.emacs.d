;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-dired-k-keymap-autoload.el
;; 関連 my-dired-k-package.el

;; ======================================================================

(let ((file "my-dired-k-package"))
  (my-bind-key-with-autoload file "K" 'dired-k dired-mode-map )
  (eval-after-load "direx"
    (quote
     (progn
       (when (require 'dired-k nil t)
         (define-key direx:direx-mode-map (kbd "K") 'direx-k ) ; PENDING autoload 失敗する。
         )
       )
     )
    )
  )

