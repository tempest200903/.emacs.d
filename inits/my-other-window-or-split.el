;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-other-window-or-split.el

;; ============================================================================
;; * [2014-07-31 木] http://d.hatena.ne.jp/rubikitch/20100210/emacs
;; http://shibayu36.hatenablog.com/entry/2012/12/18/161455
;; emacs の window 幅に合わせて、分割数を変える - $shibayu36->blog;

(defun my-split-window-auto ()
  "window 幅に合わせて分割方向を変える"
  (interactive)
  (message "(window-width) {%s}" (window-width))
  (when (one-window-p)
    (if (>= (window-width) (* 2 (window-height)))
        (split-window-horizontally)
      (split-window-vertically)
      )
    )
  (win-switch-dispatch)
  )

(defun my-other-window-or-split (&optional arg)
  (interactive "p")
  (cond
   ((equal arg 4) (delete-other-windows))
   ((equal arg 16) (delete-window))
   (t (my-split-window-auto))
   )
  )

;; 分割したバッファを入れ替えるのは my-rotate-package.el my-rotate-window-or-layout-or-tiled
;; ----------------------------------------------------------------------
(provide 'my-other-window-or-split)
;; ----------------------------------------------------------------------
