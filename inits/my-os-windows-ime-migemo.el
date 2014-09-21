;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-os-windows-ime-migemo.el
;; ======================================================================
(require 'my-os-windows-ime)
(require 'my-migemo)
;;
;; migemo を使う場合、 isearch で IME をオフにする
;; http://www.jaist.ac.jp/~n-yoshi/tips/elisp_tips.html#ime-off
;; 常にオフにすると、 migemo-isearch-toggle-migemo で migemo off にしたときに困る。
;; 
(when migemo-command
  (wrap-function-to-control-ime 'isearch-forward t nil)
  (wrap-function-to-control-ime 'isearch-forward-regexp t nil)
  (wrap-function-to-control-ime 'isearch-backward t nil)
  (wrap-function-to-control-ime 'isearch-backward-regexp t nil)
  (defun my-isearch-forward-control-ime ()
    "migemo ON なら IME を OFF にする"
    (interactive)
    (if migemo-isearch-enable-p
        (isearch-forward) (isearch-forward-original))
    )
  (defun my-isearch-forward-regexp-original-control-ime ()
    "migemo ON なら IME を OFF にする"
    (interactive)
    (if migemo-isearch-enable-p
        (isearch-forward-regexp-original)
      (isearch-forward-regexp-original-original))
    )
  (defun my-isearch-backward-original-control-ime ()
    "migemo ON なら IME を OFF にする"
    (interactive)
    (if migemo-isearch-enable-p
        (isearch-backward-original)
      (isearch-backward-original-original))
    )
  (defun my-isearch-backward-regexp-original-control-ime ()
    "migemo ON なら IME を OFF にする"
    (interactive)
    (if migemo-isearch-enable-p
        (isearch-backward-regexp-original)
      (isearch-backward-regexp-original-original))
    )
  (define-key global-map (kbd "C-s") 'my-isearch-forward-control-ime)
  (define-key global-map (kbd "C-M-s") 'my-isearch-forward-regexp-original-control-ime)
  (define-key global-map (kbd "C-r") 'my-isearch-backward-original-control-ime)
  (define-key global-map (kbd "C-M-r") 'my-isearch-backward-regexp-original-control-ime)
  )
