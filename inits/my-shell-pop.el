;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2012-06-12
;; ======================================================================
;; * [2011-11-04 金] shell-pop.el 導入
;; - http://d.hatena.ne.jp/kyagi/20100221
;; - http://www.emacswiki.org/emacs-en/ShellPop
;; - http://www.emacswiki.org/emacs/shell-pop.el
;; - M-x auto-install-from-emacswiki "shell-pop.el"
;; - ~/.emacs.d/auto-install/shell-pop.el
(when (not (require 'shell-pop nil t))
  (progn
    (auto-install-from-emacswiki "shell-pop.el")
    )
  )
(when (require 'shell-pop nil t)
  (progn
    (shell-pop-set-window-height 40)
    (global-set-key (kbd "M-s M-@") 'shell-pop)
    )
  )
