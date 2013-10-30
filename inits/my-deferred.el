;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; * [2012-01-04 水] deferred.el インストール。
(when nil
  (auto-install-from-url "http://github.com/kiwanami/emacs-deferred/raw/master/deferred.el")
  (auto-install-from-url "http://github.com/kiwanami/emacs-inertial-scroll/raw/master/inertial-scroll.el")
  )
;; * [2012-01-04 水] 慣性スクロール。
(when nil
  (require 'inertial-scroll)
  (setq inertias-global-minor-mode-map 
        (inertias-define-keymap
         '(
           ("<next>"  . inertias-up)
           ("<prior>" . inertias-down)
           ("C-v"     . inertias-up)
           ("M-v"     . inertias-down)
           ) inertias-prefix-key))
  (inertias-global-minor-mode 1)
  )
(when nil
  (inertias-global-minor-mode -1)
  )
