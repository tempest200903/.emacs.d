;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-01-07
;; my-linum-mode.el
;; ======================================================================
;; * [2012-04-18 水] ホワイトリスト方式
(defun my-linum-mode-on () "linum-mode を on にする。"
  (interactive)
  (unless (minibufferp)
    (linum-mode 1)))
(when (require 'linum nil t)
  (add-hook 'dired-mode-hook 'my-linum-mode-on)
  (add-hook 'emacs-lisp-mode-hook 'my-linum-mode-on)
  (add-hook 'grep-mode-hook 'my-linum-mode-on)
  (add-hook 'howm-view-summary-mode-hook 'my-linum-mode-on)
  (add-hook 'java-mode-hook 'my-linum-mode-on)
  (add-hook 'occur-mode-hook 'my-linum-mode-on)
  (add-hook 'php-mode-hook 'my-linum-mode-on)
  (add-hook 'recentf-dialog-mode-hook 'my-linum-mode-on)
  (add-hook 'sql-mode-hook 'my-linum-mode-on)
  (add-hook 'php-mode 'my-linum-mode-on)
  )
;; ----------------------------------------------------------------------
;; [Emacs]linum-modeを軽くする - daimatzメモ - http://d.hatena.ne.jp/daimatz/20120215/1329248780
(setq linum-delay t)
(defadvice linum-schedule (around linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))
;; ----------------------------------------------------------------------
(global-set-key (kbd "C-z C-x C-l") 'linum-mode)
;; ----------------------------------------------------------------------
;; * [2011-11-02 水] 参考 *-mode-hook 一覧
;; Buffer-menu-mode-hook
;; Custom-mode-hook
;; action-lock-mode-off-hook
;; action-lock-mode-on-hook
;; after-change-major-mode-hook
;; apropos-mode-hook
;; bibtex-mode-hook
;; calendar-mode-hook
;; change-major-mode-hook
;; comint-mode-hook
;; compilation-mode-hook
;; completion-list-mode-hook
;; custom-mode-hook
;; delay-mode-hooks
;; delayed-mode-hooks
;; diary-fancy-display-mode-hook
;; diary-mode-hook
;; dired-mode-hook
;; emacs-lisp-mode-hook
;; gnus-group-mode-hook
;; gnus-summary-mode-hook
;; gnus-undo-mode-hook
;; grep-mode-hook
;; help-mode-hook
;; howm-mode-hook
;; howm-mode-off-hook
;; howm-mode-on-hook
;; howm-remember-mode-hook
;; howm-view-contents-mode-hook
;; howm-view-summary-mode-hook
;; illusion-mode-on-hook
;; inferior-lisp-mode-hook
;; isearch-mode-end-hook
;; isearch-mode-end-hook-quit
;; isearch-mode-hook
;; java-mode-hook
;; lisp-interaction-mode-hook
;; lisp-mode-hook
;; message-mode-hook
;; occur-mode-find-occurrence-hook
;; occur-mode-hook
;; org-agenda-mode-hook
;; org-mode-hook
;; org-src-mode-hook
;; outline-mode-hook
;; paragraph-indent-text-mode-hook
;; php-mode-hook
;; picture-mode-hook
;; recentf-dialog-mode-hook
;; riffle-contents-mode-hook
;; riffle-mode-hook
;; riffle-sample-contents-mode-hook
;; riffle-sample-summary-mode-hook
;; riffle-summary-mode-hook
;; rmail-mode-hook
;; special-mode-hook
;; sql-mode-hook
;; text-mode-hook
;; vc-svn-log-view-mode-hook
;; view-mode-hook
;; w3m-minor-mode-hook
;; w3m-mode-hook
