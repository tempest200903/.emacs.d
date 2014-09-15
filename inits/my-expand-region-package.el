;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-expand-region-package.el
;; ======================================================================
;; * [2014-09-14 日] expand-region.el 導入
;; http://qiita.com/hottestseason/items/1e8a46ad1ebcf7d0e11c#2-15
;; https://github.com/magnars/expand-region.el
;; ----------------------------------------------------------------------
;; ~/.emacs.d/vendor/elpa/expand-region-readme.txt
;; Expand region increases the selected region by semantic units. Just keep
;; pressing the key until it selects what you want.
;; ----------------------------------------------------------------------
(when (and
       (package-require 'expand-region nil nil t)
       t)
  (use-package expand-region
    :config (progn
              (defun er/add-text-mode-expansions ()
                (make-variable-buffer-local 'er/try-expand-list)
                (setq er/try-expand-list (append
                                          er/try-expand-list
                                          '(mark-paragraph
                                            mark-page))))
              (er/enable-mode-expansions 'text-mode 'er/add-text-mode-expansions)
              )
    )
  )
;; ----------------------------------------------------------------------
;; customize
;; ~/.emacs.d/custom-goat/my-emacs-custom.el
;; '(expand-region-autocopy-register "e")
;; ----------------------------------------------------------------------
(provide 'my-expand-region-package)
;; ----------------------------------------------------------------------
