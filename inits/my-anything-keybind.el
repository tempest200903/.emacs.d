;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-anything-keybind.el
;; #+LAST_UPDATED: 2014-12-12
;; ============================================================================

;; TODO describe-bindings バッファを作って occur する。
(defun my-anything-keybind () ""
  (interactive)
  (describe-bindings)
  (anything-occur)
)
(global-set-key (kbd "C-t C-\\") 'my-anything-keybind)
