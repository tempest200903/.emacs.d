;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-agenda-mode.el
;; 関連 my-org-agenda-mode-map.el
;; #+LAST_UPDATED: 2014-12-11
;; ======================================================================
;; * [2014-12-11 木]
;; ** TODO org-agenda-goto でウィンドウ分割をカスタマイズする
;; - 現状、 org-agenda-goto 1回目は上下2分割、 org-agenda-goto 2回目は左右下3分割になる。
;; - 常に上下2分割、あるいは、常に左右2分割、のようにカスタマイズしたい。
;; - とりあえず、 org-agenda-goto をラップする。
;;   - C-u M-x my-org-agenda-goto で (delete-other-windows) (org-agenda-goto) にする。

(defun my-org-agenda-goto (&optional arg)
  "ウィンドウ分割をカスタマイズする org-agenda-goto"
  (interactive "p")
  (cond
   ((equal arg 4)       (org-agenda-goto))
   ((equal arg 16)      (progn
                          (delete-other-windows)
                          (org-agenda-goto)
                          )
    )
   (t                   (progn
                          (delete-other-windows)
                          (org-agenda-goto)
                          )
                        )
   )
  )

(defun my-org-agenda-show-and-scroll-up (&optional arg)
  "ウィンドウ分割をカスタマイズする org-agenda-show-and-scroll-up"
  (interactive "p")
  (cond
   ((equal arg 4)       (org-agenda-show-and-scroll-up))
   ((equal arg 16)      (progn
                          (delete-other-windows)
                          (org-agenda-show-and-scroll-up)
                          )
    )
   (t                   (progn
                          (delete-other-windows)
                          (org-agenda-show-and-scroll-up)
                          )
                        )
   )
  )


;; ----------------------------------------------------------------------

(provide 'my-org-agenda-mode)
