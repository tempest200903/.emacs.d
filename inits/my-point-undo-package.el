;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-point-undo-package.el
;; ======================================================================
;; * [2014-09-13 土] インストール
;; http://www.emacswiki.org/emacs/point-undo.el
;; (package-install 'point-undo)
;; ----------------------------------------------------------------------
(package-require 'point-undo nil nil t)
;; ----------------------------------------------------------------------
(bind-key "M-g M-b" 'point-undo)
(bind-key "M-g M-f" 'point-redo)
;; ----------------------------------------------------------------------
(provide 'my-point-undo-package)
