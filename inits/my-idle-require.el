;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-idle-require.el

;; ======================================================================
;; * [2014-11-02 日] http://sheephead.homelinux.org/2010/11/12/6288/
;; https://github.com/nschum/idle-require.el/blob/master/idle-require.el
;; https://marmalade-repo.org/packages/idle-require

(when (require 'my-package nil t)
  (when (package-require 'idle-require nil nil t)
    (idle-require 'nxml-mode)
    (idle-require-mode 1)
    )
  )

(defun my-idle-require (FEATURE &optional FILENAME NOERROR)
  "my wrapper idle-require"
  (idle-require FEATURE FILENAME NOERROR) ; (idle-require FEATURE &optional FILENAME NOERROR)
  )
