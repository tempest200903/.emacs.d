;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-mode-buffer.el
;; ======================================================================
;; * [2011-09-28 水] org agenda buffer への switch-to-buffer-other-window
;;;###autoload
(defun my-org-agenda-list-switch-to-buffer ()
  "Switch to *Org Agenda* buffer."
  (interactive)
  (if (get-buffer "*Org Agenda*")
      (switch-to-buffer-other-window "*Org Agenda*")
    (call-interactively 'org-agenda-list)))
;; ----------------------------------------------------------------------
;; * [2013-11-01 金] provide
(provide 'my-org-mode-buffer)
