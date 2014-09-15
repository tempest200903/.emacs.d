;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2014-09-14
;; my-rotate-package.el
;; my-rotate-keymap-autoload.el
;; ======================================================================
;; * [2014-09-10 水] rotate 導入
;; - (package-require 'rotate nil nil t) を eval する。
;; http://a-newcomer.com/56
;; https://github.com/daic-h/emacs-rotate
;; ----------------------------------------------------------------------
(when (and
       (package-require 'rotate nil nil t)
       t)
  )
;; ----------------------------------------------------------------------
(defun my-rotate-window-or-layout-or-tiled (&optional arg)
  "no arg rotate-window, arg rotate-layout, double arg rotate:tiled."
  (interactive "p")
  (cond
   ((equal arg 4) (rotate-layout))
   ((equal arg 16) (rotate:tiled))
   (t (rotate-window))
  )
)
(defun my-rotate-horizontal (&optional arg)
  "no arg rotate:main-horizontal, arg rotate:even-horizontal."
  (interactive "p")
  (cond
   ((equal arg 4) (rotate:even-horizontal))
   (t (rotate:main-horizontal))
  )
)
(defun my-rotate-vertical (&optional arg)
  "no arg rotate:main-vertical, arg rotate:even-vertical."
  (interactive "p")
  (cond
   ((equal arg 4) (rotate:even-vertical))
   (t (rotate:main-vertical))
  )
)
;; ----------------------------------------------------------------------
(provide 'my-rotate-package)
;; ----------------------------------------------------------------------
