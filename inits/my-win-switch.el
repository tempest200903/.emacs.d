;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-08-30 火] win-switch 導入
(require 'win-switch)
(global-set-key (kbd "<C-f8>") 'win-switch-dispatch)
;; ------------------------------------------------------------
;; cheatsheet
;; url: http://www.emacswiki.org/emacs/WinSwitch
;; i select the window above the current window.
;; k select the window below the current window.
;; j select the window left of the current window.
;; l select the window right of the current window.
;; o cycles forward through the window list in the current frame.
;; p cycles backward through the window list in the current frame.
;; SPACE cycles among existing frames.
;; u (and RETURN) exit window switching mode.
;; Waiting idle for more than win-switch-idle-time will exit window switching mode (like u does)
;; I vertically enlarges the current window
;; K vertically shrinks the current window
;; L horizontally enlarges the current window
;; J horizontally shrinks the current window
