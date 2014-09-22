;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; * [2011-12-14 水] cycle-buffer.el
;; - http://www.emacswiki.org/emacs/cycle-buffer.el
;;     cycle-buffer is yet another way of selecting buffers. Instead of prompting
;;     you for a buffer name, cycle-buffer switches to the most recently used
;;     buffer, and repeated invocations of cycle-buffer-forward switch to less
;;     recently visited buffers. 
;; - http://www.emacswiki.org/emacs/CycleBuffer
;; - M-x install-elisp-from-emacswiki cycle-buffer.el
;; - (install-elisp-from-emacswiki "cycle-buffer.el")
;; sample
;; Installation:
;; -------------
;; Add these lines in your .emacs:
;;   (autoload 'cycle-buffer "cycle-buffer" "Cycle forward." t)
;;   (autoload 'cycle-buffer-backward "cycle-buffer" "Cycle backward." t)
;;   (autoload 'cycle-buffer-permissive "cycle-buffer" "Cycle forward allowing *buffers*." t)
;;   (autoload 'cycle-buffer-backward-permissive "cycle-buffer" "Cycle backward allowing *buffers*." t)
;;   (autoload 'cycle-buffer-toggle-interesting "cycle-buffer" "Toggle if this buffer will be considered." t)
;;   (global-set-key [(f9)]        'cycle-buffer-backward)
;;   (global-set-key [(f10)]       'cycle-buffer)
;;   (global-set-key [(shift f9)]  'cycle-buffer-backward-permissive)
;;   (global-set-key [(shift f10)] 'cycle-buffer-permissive)
;; You may want to adjust the keyboard bindings to suit your taste. See below
;; for other customisable variables.
;;
(autoload 'cycle-buffer "cycle-buffer" "Cycle forward." t)
(autoload 'cycle-buffer-backward "cycle-buffer" "Cycle backward." t)
(autoload 'cycle-buffer-permissive "cycle-buffer" "Cycle forward allowing *buffers*." t)
(autoload 'cycle-buffer-backward-permissive "cycle-buffer" "Cycle backward allowing *buffers*." t)
(autoload 'cycle-buffer-toggle-interesting "cycle-buffer" "Toggle if this buffer will be considered." t)
(global-set-key (kbd "<f12>") 'cycle-buffer)
(global-set-key (kbd "<f11>") 'cycle-buffer-backward)
(global-set-key (kbd "<S-f12>") 'cycle-buffer-backward-permissive)
(global-set-key (kbd "<S-f11>") 'cycle-buffer-permissive)
;;
;; next-buffer, previous-buffer と何が違うのか？
