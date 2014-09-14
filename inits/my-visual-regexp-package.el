;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-visual-regexp-package.el
;; ======================================================================
;; * [2014-09-13 土] visual-regexp.el 導入
;; http://www.emacswiki.org/emacs/VisualRegexp
;; https://github.com/benma/visual-regexp.el
;; http://qiita.com/scalper/items/37d9c673ca0c72fec96b
;; http://rubikitch.com/2014/08/26/visual-regexp/
;; ----------------------------------------------------------------------
;; ~/.emacs.d/vendor/elpa/visual-regexp-20140825.245/visual-regexp.el
;; (define-key global-map (kbd "C-c r") 'vr/replace)
;; (define-key global-map (kbd "C-c q") 'vr/query-replace)
;; ;; if you use multiple-cursors, this is for you:
;; (define-key global-map (kbd "C-c m") 'vr/mc-mark)
;; To customize, use `M-x customize-group [RET] visual-regexp`.
;; ----------------------------------------------------------------------
(package-require 'visual-regexp nil nil t)
;; ----------------------------------------------------------------------
(provide 'my-visual-regexp)
;; ----------------------------------------------------------------------
