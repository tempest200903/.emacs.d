;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-view-mode-keymap.el

;; ======================================================================

(when nil
  (define-key view-mode-map (kbd "S-SPC")          'View-scroll-page-backward)
)
;; Symbol's value as variable is void: view-mode-map
;; 起動時は view-mode-map がないので失敗する。
