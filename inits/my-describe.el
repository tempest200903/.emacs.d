;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-describe.el
;; ======================================================================
;; * [2012-05-20 日] cf. n:/download/Emacs/sample_emacs_d/github.com.shishi/shishi-.emacs.d-9d470cf/inits/05-util.el
;; http://www.bookshelf.jp/soft/meadow_15.html#SEC120
;; カーソル位置のフェイスを調べる関数
;; * [2014-09-27 土] https://github.com/znz/dot-emacs/blob/8434c73ba833791eedc1411360e10441e52b370e/init.el.d/50face.el
;; ----------------------------------------------------------------------
(defun my-describe-face-at-point-briefly ()
  "Return face used at point."
  (interactive)
  (message "%s" (get-char-property (point) 'face)))
(defun my-describe-face-at-point ()
  "Return face used at point."
  (interactive)
  (describe-face (get-char-property (point) 'face)))

(require 'my-prefix-arg-commands)
(prefix-arg-commands-create my-describe-face-at-point-command-prefix-arg
                            '(my-describe-face-at-point-briefly
                              my-describe-face-at-point
                              )
                            )

;; ----------------------------------------------------------------------
(provide 'my-describe)
;; ----------------------------------------------------------------------
;; * [2014-09-27 土] TODO auto-load
