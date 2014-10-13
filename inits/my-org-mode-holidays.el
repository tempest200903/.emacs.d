;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-mode-holidays.el
;; ======================================================================
;; * [2014-10-11 土] **** TODO org-shiftright で土日曜日と祝日をスキップする 

(defcustom my-org-mode-holidays-dictionary-file-path nil "祝日を記した辞書ファイルのパス")

(defun my-org-mode-holidays-dictionary-load ()
  "辞書ファイルを読み込む"
  (when my-org-mode-holidays-dictionary-file-path
    )
  )

(defun my-org-shiftright-skipping-japanese-holidays ()
  (interactive)
  )

(define-key global-map (kbd "<non-convert> h") 'my-org-shiftright-skipping-japanese-holidays)

