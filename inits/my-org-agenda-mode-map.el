;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; my-org-agenda-mode-map.el
;; #+LAST_UPDATED: 2014-12-11
;; ======================================================================

;; * [2013-04-03 水] org-agenda-mode-map 初期化
(defun my-org-agenda-mode-map-init ()
  "org-agenda-mode-map 初期化"
  ;; (define-key org-agenda-mode-map (kbd "Z") nil)
  (define-key org-agenda-mode-map (kbd "Z D") 'org-agenda-toggle-diary) ; "D" から移転。
  (define-key org-agenda-mode-map (kbd "Z S") 'org-save-all-org-buffers) ; "s" から移転。
  (define-key org-agenda-mode-map (kbd "_") 'org-agenda-day-view) ; "d" から "_" に移転。
  (define-key org-agenda-mode-map (kbd "\"") 'org-agenda-columns) ; alias of C-c C-x C-c
  (define-key org-agenda-mode-map (kbd "<C-tab>") 'org-agenda-columns) ; alias of C-c C-x C-c

  (let ((file "my-org-mode-schedule"))
    ;; org-save-all-org-buffers を上書き。
    (define-key org-agenda-mode-map (kbd "s") nil)
    (define-key org-agenda-mode-map (kbd "S") nil)
    (define-key org-agenda-mode-map (kbd "d") nil)
    (define-key org-agenda-mode-map (kbd "D") nil)

    ;; * [2014-11-10 月] TODO 
    ;; (my-bind-key-with-autoload file "S" 'org-agenda-schedule                    org-agenda-mode-map)
    ;; (my-bind-key-with-autoload file "1 s" 'my-org-agenda-reset-schedule-today     org-agenda-mode-map)
    ;; (my-bind-key-with-autoload file "2 s" 'my-org-agenda-reset-schedule-tomorrow1 org-agenda-mode-map)
    ;; (my-bind-key-with-autoload file "3 s" 'my-org-agenda-reset-schedule-tomorrow2 org-agenda-mode-map)
    ;; (my-bind-key-with-autoload file "4 s" 'my-org-agenda-reset-schedule-tomorrow3 org-agenda-mode-map)
    ;; (my-bind-key-with-autoload file "7 s" 'my-org-agenda-reset-schedule-1week     org-agenda-mode-map)
    ;; (my-bind-key-with-autoload file "9 s" 'my-org-agenda-reset-schedule-1month    org-agenda-mode-map)

    (my-bind-key-with-autoload file "s" 'org-agenda-schedule                    org-agenda-mode-map)
    (my-bind-key-with-autoload file "S 1" 'my-org-agenda-reset-schedule-today     org-agenda-mode-map)
    (my-bind-key-with-autoload file "S 2" 'my-org-agenda-reset-schedule-tomorrow1 org-agenda-mode-map)
    (my-bind-key-with-autoload file "S 3" 'my-org-agenda-reset-schedule-tomorrow2 org-agenda-mode-map)
    (my-bind-key-with-autoload file "S 4" 'my-org-agenda-reset-schedule-tomorrow3 org-agenda-mode-map)
    (my-bind-key-with-autoload file "S w" 'my-org-agenda-reset-schedule-1week     org-agenda-mode-map)
    (my-bind-key-with-autoload file "S m" 'my-org-agenda-reset-schedule-1month    org-agenda-mode-map)

    ;; org-agenda-day-view を上書き
    (define-key org-agenda-mode-map (kbd "d") nil)
    (my-bind-key-with-autoload file "d" 'org-agenda-deadline                    org-agenda-mode-map)
    (my-bind-key-with-autoload file "D 1" 'my-org-agenda-reset-deadline-today     org-agenda-mode-map)
    (my-bind-key-with-autoload file "D 2" 'my-org-agenda-reset-deadline-tomorrow1 org-agenda-mode-map)
    (my-bind-key-with-autoload file "D 3" 'my-org-agenda-reset-deadline-tomorrow2 org-agenda-mode-map)
    (my-bind-key-with-autoload file "D 4" 'my-org-agenda-reset-deadline-tomorrow3 org-agenda-mode-map)
    (my-bind-key-with-autoload file "D w" 'my-org-agenda-reset-deadline-1week     org-agenda-mode-map)
    (my-bind-key-with-autoload file "D m" 'my-org-agenda-reset-deadline-1month    org-agenda-mode-map)
    )

  (bind-key "C-," 'org-open-at-point org-mode-map) ; alias of C-c C-o

  (my-bind-key-with-autoload "my-org-agenda-mode" "<tab>" 'my-org-agenda-goto org-agenda-mode-map)
  (my-bind-key-with-autoload "my-org-agenda-mode" "SPC" 'my-org-agenda-show-and-scroll-up org-agenda-mode-map)

  )

(defun my-timemanager-init ()
  "my-timemanager 初期化"

  ;; default org-agenda-sunrise-sunset を上書きする。
  (my-bind-key-with-autoload "my-timemanager" "N" 'my-timemanager-write-file org-agenda-mode-map)

  ;; default org-agenda-convert-date を上書きする。
  (my-bind-key-with-autoload "my-timemanager" "C" 'my-timemanager-collect org-agenda-mode-map)

  ;; default org-agenda-phases-of-moon を上書きする
  (my-bind-key-with-autoload "my-timemanager" "M" 'my-timemanager-show-closed-project org-agenda-mode-map)
  )
(add-hook 'org-agenda-mode-hook 'my-org-agenda-mode-map-init)
(add-hook 'org-agenda-mode-hook 'my-timemanager-init)
;;
;; hook しないでいきなり define-key すると、起動時にエラー発生。
;; エラーメッセージは ` Symbol's value as variable is void: org-agenda-mode-map `.
;; これは起動時には org-agenda-mode-map がまだ存在しないため。
