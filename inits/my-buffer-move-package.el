;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-buffer-move-package.el
;; =============================================================================
;; インストール手順
;; M-x package-list-packages
;; bm を選択して install ボタンをクリックする。
;; 
(add-to-list 'load-path "~/.emacs.d/vendor/elpa/buffer-move-0.4/")
(when (not (require 'buffer-move nil t))
  (progn
    (message "require package false")
    (when (require 'package nil t)
      (progn
        (package-install 'buffer-move)
        )
      )
    )
  )
(when (require 'buffer-move nil t)
  (progn
    (message "require package true")
    (global-set-key (kbd "C-z k")     'buf-move-up)
    (global-set-key (kbd "C-z j")   'buf-move-down)
    (global-set-key (kbd "C-z h")   'buf-move-left)
    (global-set-key (kbd "C-z l")  'buf-move-right)
    )
  )
