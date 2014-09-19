;; http://dev.nozav.org/textile-mode.html
;; How to Install
;; M-x package-list-packages textile-mode
;; * [2014-09-18 木] TODO install 自動化
(require 'textile-mode)
(add-to-list 'auto-mode-alist '("\\.textile\\'" . textile-mode))
