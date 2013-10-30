;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-session-package.el
;; ======================================================================
;; * [2012-08-09 木] use variables, registers and buffer places across sessions [source: github]
;; http://www.bookshelf.jp/soft/meadow_27.html#SEC348
;; http://emacs-session.sourceforge.net/
;; ~/.emacs.d/vendor/elpa/session-20120511/session.el
(when (not (require 'session nil t))
  (progn
    (message "require session false")
    (when (require 'package nil t)
      (progn
        (package-install 'session)
        )
      )
    )
  )
(when (require 'session nil t)
  (progn
    (message "require session true")
    (add-hook 'after-init-hook 'session-initialize)
    )
  )
