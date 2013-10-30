;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-09-02 金] highlight-symbol 導入
;; - url: http://nschum.de/src/emacs/highlight-symbol/
;; - from: N:\download\Emacs\plugin\highlight-symbol.el
;; - to: N:\.emacs.d\elisp\highlight-symbol.el
;; - [[file:n:/.emacs.d/inits/my-highlight-symbol.el::highlight-symbol]]
;; - sample
;;   (require 'highlight-symbol)
;;   (global-set-key [(control f3)] 'highlight-symbol-at-point)
;;   (global-set-key [f3] 'highlight-symbol-next)
;;   (global-set-key [(shift f3)] 'highlight-symbol-prev)
;;   (global-set-key [(meta f3)] 'highlight-symbol-prev)))
;;   (global-set-key [(control meta f3)] 'highlight-symbol-query-replace)
;;
(require 'highlight-symbol)
(global-set-key (kbd "M-s s a") 'highlight-symbol-at-point)
(global-set-key (kbd "M-s s n") 'highlight-symbol-next)
(global-set-key (kbd "M-s s p") 'highlight-symbol-prev)
(global-set-key (kbd "M-s s r") 'highlight-symbol-query-replace)

;; [2012-08-09 木] ~/.emacs.d/inits/my-highlight-symbol-package.el に移行する？