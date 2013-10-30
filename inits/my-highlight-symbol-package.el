;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-highlight-symbol-package.el
;; ======================================================================
;; * [2011-09-02 金] highlight-symbol 導入
;; - url: http://nschum.de/src/emacs/highlight-symbol/
;; - from: N:\download\Emacs\plugin\highlight-symbol.el
;; - to: N:\.emacs.d\elisp\highlight-symbol.el
;; - [[file:n:/.emacs.d/inits/my-highlight-symbol.el::highlight-symbol]]
;; ----------------------------------------------------------------------
;; * [2012-08-09 木] package highlight-symbol.el --- automatic and manual symbol highlighting
;; ~/.emacs.d/vendor/elpa/highlight-symbol-20090413/highlight-symbol.el
(when (not (require 'highlight-symbol nil t))
  (progn
    (message "require highlight-symbol false")
    (when (require 'package nil t)
      (progn
        (package-install 'highlight-symbol)
        )
      )
    )
  )
(when (require 'highlight-symbol nil t)
  (progn
    (message "require highlight-symbol true")
    (global-set-key (kbd "M-s s a") 'highlight-symbol-at-point)
    (global-set-key (kbd "M-s s n") 'highlight-symbol-next)
    (global-set-key (kbd "M-s s p") 'highlight-symbol-prev)
    (global-set-key (kbd "M-s s r") 'highlight-symbol-query-replace)
    )
  )
