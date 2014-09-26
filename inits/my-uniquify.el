;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-uniquify.el
;; ======================================================================
;; * [2014-09-27 土] https://github.com/znz/dot-emacs/blob/8434c73ba833791eedc1411360e10441e52b370e/init.el.d/50mode-line.el
;; 同一ファイル名のバッファ名を分かりやすくする。
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")
(setq uniquify-min-dir-content 1)
