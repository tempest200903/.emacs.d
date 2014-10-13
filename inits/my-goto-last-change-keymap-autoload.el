;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2014-10-09
;; my-goto-last-change-keymap-autoload.el
;; 関連 my-goto-last-change.el
;; ======================================================================

;; (define-key global-map (kbd "M-g M-l")     'goto-last-change)
;; (define-key global-map (kbd "M-g M-<SPC>") 'goto-last-change-with-auto-marks)
;; (define-key global-map (kbd "M-g M-k")     'goto-last-change-reverse)

(let ((p "my-goto-last-change"))
  (my-bind-key-with-autoload p "M-g M-l"     'goto-last-change)
  (my-bind-key-with-autoload p "M-g M-<SPC>" 'goto-last-change-with-auto-marks)
  (my-bind-key-with-autoload p "M-g M-k"     'goto-last-change-reverse)
  )

;; memo
;; 
;; ** (goto-last-change &optional MARK-POINT MINIMAL-LINE-DISTANCE)
;; Set point to the position of the last change.
;; Consecutive calls set point to the position of the previous change.
;; With a prefix arg (optional arg MARK-POINT non-nil), set mark so C-x C-x
;; will return point to the current position.
;; 
;; ** (goto-last-change-with-auto-marks &optional MINIMAL-LINE-DISTANCE)
;; Calls goto-last-change and sets the mark at only the first invocations
;; in a sequence of invocations.
