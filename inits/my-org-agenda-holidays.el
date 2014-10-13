;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-agenda-holidays.el

;; ======================================================================
;; * [2014-10-11 土]  org-agenda-holidays 失敗を回避する 
;; ***** org-version 7.8.11
;; - *Org Agenda* buffer で H (M-x org-agenda-holidays) を実行すると、失敗する。
;; - メッセージは org-agenda-execute-calendar-command: Wrong type argument: commandp, list-calendar-holidays
;; - *Backtrace*
;;   #+BEGIN_EXAMPLE
;;   Debugger entered--Lisp error: (wrong-type-argument commandp list-calendar-holidays)
;;     call-interactively(list-calendar-holidays)
;;     org-agenda-execute-calendar-command(list-calendar-holidays)
;;     org-agenda-holidays()
;;     call-interactively(org-agenda-holidays nil nil)
;;   #+END_EXAMPLE
;; - (org-agenda-execute-calendar-command 'list-calendar-holidays)
;;   - この式で失敗している。
;;   - list-calendar-holidays という名前のコマンドがないから。
;; - [[file:c:/tool/gnupack/app/emacs/emacs/lisp/calendar/holidays.el::list-calendar-holidays]]
;;   #+BEGIN_QUOTE
;;   (define-obsolete-function-alias
;;     'list-calendar-holidays 'calendar-list-holidays "23.1")
;;   #+END_QUOTE
;; - list-calendar-holidays はなくなり、代わりに calendar-list-holidays がある。
;; - org-mode 新しい version なら解消しているか？
;; ***** org-mode version 8.2.8 で試す
;; - *Backtrace*
;;   #+BEGIN_EXAMPLE
;;   Debugger entered--Lisp error: (wrong-type-argument commandp list-calendar-holidays)
;;     call-interactively(list-calendar-holidays)
;;     (progn (fset (quote calendar-cursor-to-date) (lambda (&optional error dummy) (calendar-gregorian-from-absolute (get-text-property point (quote day))))) (call-interactively cmd))
;;     (unwind-protect (progn (fset (quote calendar-cursor-to-date) (lambda (&optional error dummy) (calendar-gregorian-from-absolute (get-text-property point (quote day))))) (call-interactively cmd)) (fset (quote calendar-cursor-to-date) oldf))
;;     (let* ((oldf (symbol-function (quote calendar-cursor-to-date))) (point (point)) (date (calendar-gregorian-from-absolute (get-text-property point (quote day)))) (displayed-month (car date)) (displayed-year (nth 2 date))) (unwind-protect (progn (fset (quote calendar-cursor-to-date) (lambda (&optional error dummy) (calendar-gregorian-from-absolute (get-text-property point (quote day))))) (call-interactively cmd)) (fset (quote calendar-cursor-to-date) oldf)))
;;     org-agenda-execute-calendar-command(list-calendar-holidays)
;;     org-agenda-holidays()
;;     call-interactively(org-agenda-holidays nil nil)

;;   #+END_EXAMPLE
;; - [[file:~/.emacs.d/vendor/elpa/org-20141006/org-agenda.el::org-agenda-holidays]]
;;   #+BEGIN_QUOTE
;;   (defun org-agenda-holidays ()
;;     "Display the holidays for the 3 months around the cursor date."
;;     (interactive)
;;     (org-agenda-execute-calendar-command 'list-calendar-holidays))
;;   #+END_QUOTE

(defun org-agenda-holidays ()
  "Display the holidays for the 3 months around the cursor date."
  (interactive)
  (org-agenda-execute-calendar-command 'calendar-list-holidays))
