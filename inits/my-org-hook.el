;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-hook.el
;; #+LAST_UPDATED: 2014-08-28
;; ======================================================================

;; * [2011-11-16 水] 
(defun my-org-dblock-update-arg ()
  "clock-in/clock-out したときに (org-dblock-update ARG) {C-u C-c C-x C-u} を実行したい。"
  (interactive)
  (org-dblock-update t)
  )
;; (add-hook 'org-clock-out-hook 'my-org-dblock-update-arg)
;; [2014-05-09 金] org-clock-out したときに、バッファの一部を削除してしまう不具合が発生。 hook 無効にして様子を見る。
;; (remove-hook 'org-clock-out-hook 'my-org-dblock-update-arg) したら発生しなくなった。
;; ----------------------------------------------------------------------
;; * [2011-10-20 木] org-speed-commands-user の '='キーに登録する。
(defun my-org-display-outline-path ()
  "1アクションで org-display-outline-path と org-clock-display を実行したい。"
  (interactive)
  (org-dblock-update t)
  (call-interactively 'org-clock-display)
  (call-interactively 'org-display-outline-path)
  (call-interactively 'my-org-dblock-update-arg)
  )
;; ----------------------------------------------------------------------
;; [2012-02-28 火] org-clock-in に org-agenda-file-to-front する。
(add-hook 'org-clock-in-hook 'org-agenda-file-to-front)
;; (add-hook 'org-clock-out-hook 'org-agenda-file-to-front)
;; [2014-05-09 金] org-clock-out したときに、バッファの一部を削除してしまう不具合が発生。 hook 無効にして様子を見る。
;; ----------------------------------------------------------------------
;; [2012-03-01 木] org-clock-in に org-mark-ring-push する。
;; (add-hook 'org-clock-in-hook 'org-mark-ring-push)
;; (add-hook 'org-clock-out-hook 'org-mark-ring-push)
;; [2014-05-09 金] org-clock-out したときに、バッファの一部を削除してしまう不具合が発生。 hook 無効にして様子を見る。
;; ----------------------------------------------------------------------
;; [2013-09-06 金] http://whattheemacsd.com/
;; I mainly use org-mode for a collection of TODO-lists.
;; (defun myorg-update-parent-cookie ()
;;   (when (equal major-mode 'org-mode)
;;     (save-excursion
;;       (ignore-errors
;;         (org-back-to-heading)
;;         (org-update-parent-todo-statistics)))))
;; (defadvice org-kill-line (after fix-cookies activate)
;;   (myorg-update-parent-cookie))
;; (defadvice kill-whole-line (after fix-cookies activate)
;;   (myorg-update-parent-cookie))
;; So I get a little annoyed when the [17/23] cookies at the parent level aren't updated when I remove an item.
;; This code fixes that.
;;
(when nil
  (defun myorg-update-parent-cookie ()
    (when (equal major-mode 'org-mode)
      (save-excursion
        (ignore-errors
          (org-back-to-heading)
          (org-update-parent-todo-statistics)))))
  (defadvice org-kill-line (after fix-cookies activate)
    (myorg-update-parent-cookie))
  (defadvice kill-whole-line (after fix-cookies activate)
    (myorg-update-parent-cookie))
  )
;;
;; ----------------------------------------------------------------------
;; [2014-08-28 木] org-agenda-mode と一緒に使うマイナーモード。
(defun my-org-agenda-mode-minor-hook ()
  "org-agenda-mode 初期化"
  (hl-line-mode 1)
  (linum-mode 1)
  )
(add-hook 'org-agenda-mode-hook 'my-org-agenda-mode-minor-hook)
;; ----------------------------------------------------------------------
;; * [2014-09-15 月] checkbox の個数が増減したら cookies を更新する。
;; http://whattheemacsd.com/
;; (defun myorg-update-parent-cookie ()
;;   (when (equal major-mode 'org-mode)
;;     (save-excursion
;;       (ignore-errors
;;         (org-back-to-heading)
;;         (org-update-parent-todo-statistics)))))
;; (defadvice org-kill-line (after fix-cookies activate)
;;   (myorg-update-parent-cookie))
;; (defadvice kill-whole-line (after fix-cookies activate)
;;   (myorg-update-parent-cookie))
;; 動作しない。 defadvice なしでやってみる。
;;
(defun my-org-kill-line(arg)
  (interactive "p")
  (call-interactively 'org-kill-line)
  (call-interactively 'org-update-statistics-cookies)
  )
(defun my-org-yank(arg)
  (interactive "p")
  (call-interactively 'org-yank)
  (call-interactively 'org-update-statistics-cookies)
  )
(require 'bind-key)
(bind-key "C-k" 'my-org-kill-line org-mode-map)
(bind-key "C-y" 'my-org-yank org-mode-map)
;; ----------------------------------------------------------------------
;; [2012-02-28 火] org-clock-in/out delete-trailing-whitespace する。
(add-hook 'org-clock-in-hook 'delete-trailing-whitespace)
(add-hook 'org-clock-out-hook 'delete-trailing-whitespace)
;; ----------------------------------------------------------------------
;; [2014-09-20 土] 実験中。
(defun my-org-timer-done ()
  ""
  (message "my-org-timer-done")
  (when nil
    (set-face-foreground 'mode-line "white")
    (set-face-background 'mode-line "blue")
    ) ; 調整中
  )
(defun my-org-timer-start ()
  ""
  (message "my-org-timer-start")
  (when nil
    (set-face-foreground 'mode-line "RoyalBlue3")
    (set-face-background 'mode-line "LightGoldenrod1")
    ) ; 調整中
  )
(add-hook 'org-timer-done-hook 'my-org-timer-done)
(add-hook 'org-timer-start-hook 'my-org-timer-start)

;; (org-timer-start -60)
;; org-timer-done-hook
;; Hook run after countdown timer reaches zero.
;; カウントダウンタイマーが0に到達したら実行する。
;; はずなのだが、なぜか実行されない。
