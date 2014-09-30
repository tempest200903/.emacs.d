;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-delete-trailing-whitespace.el
;; #+LAST_UPDATED: 2014-10-01
;; ======================================================================

;; * [2014-10-01 水] http://d.hatena.ne.jp/kitokitoki/searchdiary?of=10&word=%2A%5Bemacs%5D

(defun my-delete-trailing-whitespace ()
  "リージョン選択時はリージョンの行末の不要な空白を削除する delete-trailing-whitespace() のラッパー"
  (interactive)
  (if (region-active-p)
      (save-excursion
        (save-restriction
          (narrow-to-region (region-beginning) (region-end))
          (delete-trailing-whitespace)))
    (delete-trailing-whitespace)
    )
  )

(provide 'my-delete-trailing-whitespace)
