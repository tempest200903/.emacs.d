;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-evil-numbers.el
;; =============================================================================
;; install: M-x package-install evil-numbers
;;
;; evil-numbers is an installed package.

;;      Status: Installed in `n:/tool/gnupack/gnupack_devel-11.00/home/.emacs.d/vendor/elpa/evil-numbers-20121109.238/'.
;;     Version: 20121109.238
;;     Summary: increment/decrement numbers like in vim [github]

;; Increment / Decrement binary, octal, decimal and hex literals

;; works like C-a/C-x in vim, i.e. searches for number up to eol and then
;; increments or decrements and keep zero padding up

;; Known Bugs:
;; See http://github.com/cofi/evil-numbers/issues

;; Install:

;; (require 'evil-numbers)

;; and bind, for example:

;; (global-set-key (kbd "C-c +") 'evil-numbers/inc-at-pt)
;; (global-set-key (kbd "C-c -") 'evil-numbers/dec-at-pt)

;; or only in evil's normal state:

;; (define-key evil-normal-state-map (kbd "C-c +") 'evil-numbers/inc-at-pt)
;; (define-key evil-normal-state-map (kbd "C-c -") 'evil-numbers/dec-at-pt)

;; Usage:
;; Go and play with your numbers!

;; [back]

;; (global-set-key (kbd "<H-right>") 'evil-numbers/inc-at-pt)
;; (global-set-key (kbd "<H-left>") 'evil-numbers/dec-at-pt)
(global-set-key (kbd "C-z <right>") 'evil-numbers/inc-at-pt)
(global-set-key (kbd "C-z <left>") 'evil-numbers/dec-at-pt)

;; * [2014-09-27 土] TODO auto-load
