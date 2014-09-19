;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-extract-bracket.el
;; =============================================================================
;; * [2014-09-19 金]
(defvar my-extract-bracket-executable "N:/work/myscript/ruby/extract_bracket.sh")

(defun my-extract-bracket () ""
  (interactive)
  (write-file "N:/work/myscript/ruby/extract_bracket_input.txt")
  (shell-command-on-region (mark) (point) my-extract-bracket-executable)
  (find-file "N:/work/myscript/ruby/extract_bracket_output.txt")
  )
;; TODO なぜか標準入力から入力できない。
;; TODO スクリプトを置く場所を .emacs.d/script にする？
