;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-guide-key-package.el
;; #+LAST_UPDATED: 2014-09-28
;; ======================================================================
;; * [2014-09-28 日] 導入
;; http://www.kaichan.info/blog/2013-12-22-emacs-advent-calendar-2013-22.html

(when (package-require 'guide-key)
  (setq guide-key/guide-key-sequence
        '(
          "C-c &"
          "C-c ,"
          "C-h"
          "C-h C-x"
          "C-t"
          "C-x"
          "C-x RET"
          "C-x 4"
          "C-x 5"
          "C-x 6"
          "C-x a"
          "C-x k"
          "C-x n"
          "C-x m"
          "C-x r"
          "C-x v"
          "C-x y"
          "C-x @"
          "C-z"
          "C-z C-x"
          "C-z C-x 4"
          "C-z C-x 5"
          "C-z 4"
          "C-z 5"
          "C-z C-x"
          "C-^"
          "M-g"
          "M-o"
          "M-s"
          "M-s h"
          "M-s l"
          "M-s p"
          "M-s M-q"
          "M-s M-v"
          "s-:"
          "<oem-attn>"
          "<f1>"
          "<f2>"
          "<C-non-convert>"
          "<non-convert> x"
          "<non-convert> c"
          "<non-convert> t"
          "<non-convert> z"
          "<C-convert>"
          "<S-convert>"
          ))
  (guide-key-mode 1)  ; guide-key-mode を有効にする
  )
