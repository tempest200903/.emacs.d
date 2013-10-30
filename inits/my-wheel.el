;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; Minor mode for displaying buffer text in a larger/smaller font than usual.
(autoload 'text-scale-decrease "face-remap" nil t)
(autoload 'text-scale-increase "face-remap" nil t)
;; Decrease the height of the default face in the current buffer by DEC steps.
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
;; Increase the height of the default face in the current buffer by INC steps.
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
;; TODO (text-scale-mode 1) はどこに書けばいい？ 遅延読み込みするためには、トップレベルに書いてはダメなはず。
;; ----------------------------------------------------------------------
;; (when (require 'face-remap nil t)
;;   (text-scale-mode 1)
;;   ;; Decrease the height of the default face in the current buffer by DEC steps.
;;   (global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)
;;   ;; Increase the height of the default face in the current buffer by INC steps.
;;   (global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
;;   )
