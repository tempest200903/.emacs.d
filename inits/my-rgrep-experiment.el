;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-rgrep-experiment.el
;; =============================================================================
;; ~/.emacs.d/memo/emacs-bug-history.org.txt
;; rgrep 不具合
;; testcase.3 日本語文字列を検索する場合
(defun rgrep-experiment-utf-8 () ""
  (interactive)
  (let (coding-system "utf-8")
    (setq file-name-coding-system coding-system)
    (rgrep "不具合" "*.txt" "n:/.emacs.d/memo/")
    )
  )
;; (eval-buffer)
