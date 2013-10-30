;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
(fset 'my-new-page-with-timestamp
   [?\C-a ?\C-q ?\C-l ?  ?\C-u ?\C-c ?u return return])
(global-set-key (kbd "C-z C-q C-l")  'my-new-page-with-timestamp)
