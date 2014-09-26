;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; my-org-clone-subtree.el
;; #+LAST_UPDATED: 2014-09-05
;; ----------------------------------------------------------------------
;; * [2014-09-05 金] alias
;; org-clone-subtree-with-time-shift して、今日の日付をセットする。
;; (define-key org-mode-map (kbd "C-c M-.") 'my-org-clone-subtree-with-time-shift-today)
;; ** TODO [2014-09-16 火] org-reset-checkbox-state-subtree も入れる。
;; ** TODO [2014-09-16 火] (define-key org-mode-map (kbd "C-c M-.") (kbd "C- ...")) 形式にしたほうが読みやすいし変更しやすい。
;; ** TODO [2014-09-19 金] my-org-clone-subtree-with-time-shift-1day バグがある。 SCHEDULE より DEADLINE が先にあると、 DEADLINE を読み取ってしまう。
;; ** TODO [2014-09-25 木] DRY
;; ** TODO [2014-09-25 木] undo 1回で最初の状態に戻したい。
;; ** TODO [2014-09-25 木] C-u 数字で日数を指定したい。
;; org-clone-subtree-with-time-shift して、1日インクリメントするキーボードマクロ。
(define-key org-mode-map
  (kbd "C-c M-1")
  (kbd "C-c C-x c 1 RET +1d RET C-c C-n C-M-s SCHEDULED RET M-f M-w M-[ C-M-s -d RET C-y C-u 3 M-d")
  )
;; org-clone-subtree-with-time-shift して、5日インクリメントするキーボードマクロ。
(define-key org-mode-map
  (kbd "C-c M-5")
  (kbd "C-c C-x c 1 RET +5d RET C-c C-n C-M-s SCHEDULED RET M-f M-w M-[ C-M-s -d RET C-y C-u 3 M-d")
  )
;; org-clone-subtree-with-time-shift して、6日インクリメントするキーボードマクロ。
(define-key org-mode-map
  (kbd "C-c M-6")
  (kbd "C-c C-x c 1 RET +6d RET C-c C-n C-M-s SCHEDULED RET M-f M-w M-[ C-M-s -d RET C-y C-u 3 M-d")
  )
;; org-clone-subtree-with-time-shift して、7日インクリメントするキーボードマクロ。
(define-key org-mode-map
  (kbd "C-c M-7")
  (kbd "C-c C-x c 1 RET +7d RET C-c C-n C-M-s SCHEDULED RET M-f M-w M-[ C-M-s -d RET C-y C-u 3 M-d")
  )
;;
(defun my-org-clone-subtree-with-time-shift (shift)
  ""
  (interactive)
  (progn
    (outline-up-heading 1)
    (org-clone-subtree-with-time-shift 1 shift)
    (org-forward-same-level 1)
    (org-reset-checkbox-state-subtree)
    (org-agenda-set-restriction-lock)
    (org-todo-list "DONE")
    (org-agenda-bulk-mark-regexp "DONE")
    (org-agenda-bulk-action nil)
    )
  ) 
;; * TODO [2014-09-26 金] (kbd "C-c M-1") バグあり。実行後の見出しが 〔task-d2014-09-2014-09-25〕 になってしまう。
;; かならずバグ発生するわけではない。
;; ----------------------------------------------------------------------
