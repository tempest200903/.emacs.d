;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; =============================================================================
;; * [2012-05-23 水]
;; http://d.hatena.ne.jp/uk-ar/20120401/1333282805
(when nil
  "install"
  (auto-install-from-url "https://raw.github.com/uk-ar/flex-autopair/master/flex-autopair.el")
  )
(when (require 'flex-autopair nil t)
  (flex-autopair-mode t)
  )

