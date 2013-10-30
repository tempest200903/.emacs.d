;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-anything-show-buffer.el
;; ======================================================================
;; * [2012-05-22 火] n:/download/Emacs/sample_emacs_d/github.com.shishi/shishi-.emacs.d-9d470cf/inits/10-anything.el
;; anything カーソル合った時に persistent-action 実行
(defun show-buffer-move-by-move-extend ()
  (interactive)
  (when (or (memq (assoc-default 'type (anything-get-current-source)) '(buffer sexp))
            (equal (cdr (assq 'name (anything-get-current-source))) "Imenu")
            (equal (cdr (assq 'name (anything-get-current-source))) "Etags")
            (equal (cdr (assq 'name (anything-get-current-source))) "Exuberant ctags")
            (equal (cdr (assq 'name (anything-get-current-source))) "Occur")
            )
    (anything-execute-persistent-action))
  )
(add-hook 'anything-move-selection-after-hook 'show-buffer-move-by-move-extend)
