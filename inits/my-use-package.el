;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-use-package.el
;; ======================================================================
;; * [2014-09-12 金] インストール
;; http://rubikitch.com/2014/09/09/use-package/
;; (package-install 'use-package)
;; ~/.emacs.d/vendor/elpa/use-package-20140908.806/use-package.el
;; ----------------------------------------------------------------------
;; * [2014-09-11 木] 設定
;;
(when (and
       (package-require 'use-package nil nil t)
       t)
  (eval-after-load "use-package"
    '(progn
       )
    )
  )
;;
;; ----------------------------------------------------------------------
(provide 'my-use-package)
;; ----------------------------------------------------------------------
