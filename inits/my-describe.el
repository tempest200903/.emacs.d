;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-describe.el
;; ======================================================================
;; * [2012-05-20 日] cf. n:/download/Emacs/sample_emacs_d/github.com.shishi/shishi-.emacs.d-9d470cf/inits/05-util.el
;; http://www.bookshelf.jp/soft/meadow_15.html#SEC120
;; カーソル位置のフェイスを調べる関数
(defun describe-face-at-point ()
  "Return face used at point."
  (interactive)
  (message "%s" (get-char-property (point)      'face)))
(provide 'my-describe)
