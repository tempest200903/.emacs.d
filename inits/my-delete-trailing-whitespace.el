;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-delete-trailing-whitespace.el
;; #+LAST_UPDATED: 2014-10-01
;; ======================================================================

;; * [2014-10-01 水] http://d.hatena.ne.jp/kitokitoki/20130126/p2

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

;; * [2014-10-01 水] http://d.hatena.ne.jp/kitokitoki/20110409/p4
;; [emacs] ^M を削除する

;; (defun my-delete-cr (start end)
;;   (interactive "r")
;;   (save-restriction
;;     (narrow-to-region start end)
;;     (goto-char (point-min))
;;     (while (re-search-forward "^M$" nil t) (replace-match "" nil t))))
;; 未完成。
;; TODO ソースコードに直接 CR そのものを書くと diff, blame しづらい。別の方法を探す。
(define-key global-map
  (kbd "M-s c r")
  (kbd "M-x query-replace RET C-M-q C-m RET RET")
  )

(provide 'my-delete-trailing-whitespace)
