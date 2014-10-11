;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-evil-numbers-keymap-autoload.el
;; 関連 my-evil-numbers-package.el

;; =============================================================================
;; * [2014-09-27 土] カーソル位置にある数値を増減する。

;; (global-set-key (kbd "C-z <right>") 'evil-numbers/inc-at-pt)
;; (global-set-key (kbd "C-z <left>")  'evil-numbers/dec-at-pt)

(let ((file "my-evil-numbers-package"))
  (my-bind-key-with-autoload file "C-z <right>" 'evil-numbers/inc-at-pt)
  (my-bind-key-with-autoload file "C-z <left>"  'evil-numbers/dec-at-pt)
  )


