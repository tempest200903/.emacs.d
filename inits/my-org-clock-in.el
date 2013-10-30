;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; [2012-02-28 火] 実験中。あとで my-org-hook.el に統合する。
(defun my-org-agenda-file-to-front () 
  "org-clock-in に org-agenda-file-to-front する"
  (org-agenda-file-to-front))

(add-hook 'org-clock-in-hook 'my-org-agenda-file-to-front)
