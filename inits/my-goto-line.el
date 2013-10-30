;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-goto-line.el
;; =============================================================================
;; http://whattheemacsd.com/
;; What are those line numbers for anyway?
;; (global-set-key [remap goto-line] 'goto-line-with-feedback)
;; (defun goto-line-with-feedback ()
;;   "Show line numbers temporarily, while prompting for the line number input"
;;   (interactive)
;;   (unwind-protect
;;       (progn
;;         (linum-mode 1)
;;         (goto-line (read-number "Goto line: ")))
;;     (linum-mode -1)))
;; I don't have line numbers visible in the fringe of my Emacs. If I want to go to a line number, that is usually because it is referenced in an error message somewhere. Showing them all the time is just noise to me.
;; Still, many people want line numbers visible. I guess that is because they use them for navigation. This snippet shows line numbers temporarily just when you're going to a line number with goto-line.
;; Notice the nice remap-trick in the key binding. It will remap all key bindings from goto-line to goto-line-with-feedback. Neat!


(global-set-key [remap goto-line] 'goto-line-with-feedback)
(defun goto-line-with-feedback ()
  "Show line numbers temporarily, while prompting for the line number input"
  (interactive)
  (unwind-protect
      (progn
        (linum-mode 1)
        (goto-line (read-number "Goto line: ")))
    (linum-mode -1)))
