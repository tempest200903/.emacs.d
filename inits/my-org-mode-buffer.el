;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-mode-buffer.el
;; ======================================================================
;; * [2011-09-28 水] org agenda buffer への switch-to-buffer-other-window
(defun my-org-agenda-list-switch-to-buffer (arg)
  "Switch to *Org Agenda* buffer. If arg is 4, switch-to-buffer-other-window"
  (interactive "P")
  (message "my-org-agenda-list-switch-to-buffer")
  (let ((buffer-name "*Org Agenda*"))
    (if (get-buffer buffer-name)
        (cond
         ((equal arg 4)
          (my-org-agenda-list-switch-to-buffer-other-window)
          )
         (t
          (switch-to-buffer buffer-name)
          (delete-other-windows)
          )
         )
      (call-interactively 'org-agenda-list))
    )
  )

(defun my-org-agenda-list-switch-to-buffer-other-window (arg)
  "Switch to *Org Agenda* buffer other-window"
  (interactive "P")
  (message "my-org-agenda-list-switch-to-buffer-other-window")
  (let ((buffer-name "*Org Agenda*"))
    (if (get-buffer buffer-name)
        (progn
          (when (one-window-p) (split-window-horizontally))
          (switch-to-buffer-other-window buffer-name)
          (switch-to-last-buffer)
          (other-window 1)
          )
      (call-interactively 'org-agenda-list)
      )
    )
  )

;; 1回目は my-org-agenda-list-switch-to-buffer, 
;; 2回目は my-org-agenda-list-switch-to-buffer-other-window
(define-sequential-command my-org-agenda-list-switch-to-buffer-sequential
  my-org-agenda-list-switch-to-buffer
  my-org-agenda-list-switch-to-buffer-other-window)
;; ----------------------------------------------------------------------
(defun my-org-edit-agenda-file-list-switch-to-buffer ()
  "Switch to *Customize Option: Org Agenda Files*"
  (interactive)
  (if (get-buffer "*Customize Option: Org Agenda Files*")
      (switch-to-buffer-other-window "*Customize Option: Org Agenda Files*")
    (call-interactively 'org-edit-agenda-file-list))
  )
;; ----------------------------------------------------------------------
;; * [2013-11-01 金] provide
(provide 'my-org-mode-buffer)
;; ----------------------------------------------------------------------
