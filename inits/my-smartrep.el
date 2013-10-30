;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; =============================================================================
;; * [2012-05-23 水] 連続操作を素敵にするsmartrep.el作った
;; http://sheephead.homelinux.org/2011/12/19/6930/
(when (not (require 'smartrep nil t))
  (progn
    (auto-install-from-emacswiki "smartrep.el") 
    )
  )

(define-key global-map "\C-t" nil)
(defvar my-anything-map (make-keymap))
(define-key global-map "\C-t" my-anything-map)

(when (require 'smartrep nil t)
  (progn
    (eval-after-load "org"
      '(progn
         (smartrep-define-key
             org-mode-map "C-c" '(("C-n" . (outline-next-visible-heading 1))
                                  ("C-p" . (outline-previous-visible-heading 1))
                                  ))))
    (eval-after-load "org"
      '(progn
         (smartrep-define-key
             my-anything-map "C-t" '(("C-n" . 'raise-other-frame)
                                     ("C-p" . 'raise-other-frame-minus)
                                     ))
         ))
    (eval-after-load "org"
      '(progn
         (smartrep-define-key
             global-map "M-g" '(("M-n" . 'next-error)
                                ("M-p" . 'previous-error)
                                )))
      )
    )
  )
  ;; global-map に定義するにはどう書けばいい？
