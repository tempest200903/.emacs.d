;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-09-04
;; my-workmanager.el
;; ======================================================================

(defun my-workmanager-write-file ()
  ""
  (interactive)
  (write-file "n:/work/myscript/ruby/workmanager_time_collect_input.txt" nil)
  (org-agenda-mode)
  )

(defun my-workmanager-collect ()
  ""
  (interactive)
   (shell-command "n:/work/myscript/ruby/workmanager_time_collect.bat")
  )

(defun my-workmanager-init ()
  "my-workmanager 初期化"
  ;; default org-agenda-sunrise-sunset を上書きする。
  (define-key org-agenda-mode-map (kbd "S") 'my-workmanager-write-file) 
  ;; default org-agenda-convert-date を上書きする。
  (define-key org-agenda-mode-map (kbd "C") 'my-workmanager-collect) 
  )

(add-hook 'org-agenda-mode-hook 'my-workmanager-init)
