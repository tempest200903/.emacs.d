;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-other-window-or-split.el
;; ============================================================================
;; * [2014-07-31 木] http://d.hatena.ne.jp/rubikitch/20100210/emacs
(defun my-other-window-or-split (&optional arg)
  (interactive "p")
  (cond
   ((equal arg 4) (delete-window))
   ((equal arg 16) (delete-other-windows))
   ((one-window-p) (split-window-horizontally))
   (t (other-window 1))
  )
)
;; 分割したバッファを入れ替えるのは my-rotate-package.el my-rotate-window-or-layout-or-tiled
;; ----------------------------------------------------------------------
(provide 'my-other-window-or-split)
;; ----------------------------------------------------------------------
