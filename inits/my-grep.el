;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
(add-to-list 'auto-mode-alist '("\\.grep$" . grep-mode))
;; ----------------------------------------------------------------------
;; * [2011-09-16 金] keymap
(defun my-grep-mode-init ()
  (progn (define-key grep-mode-map (kbd "u") 'rename-uniquely) "[2011-05-20 金]")
  ;; 以下、 my-occur.el から転記しただけ。精査するべし。
  (progn (define-key grep-mode-map (kbd "h") 'highlight-regexp) "[2011-06-02 木]")
  (progn (define-key grep-mode-map (kbd "-") 'fit-window-to-buffer) "[2011-06-06 月]")
  (progn (define-key grep-mode-map (kbd "m") 'multi-grep-in-matching-buffers) "[2011-06-14 火]")
  (progn (define-key grep-mode-map (kbd "f") 'next-error-follow-minor-mode) "[2011-06-14 火]")
  )
(add-hook 'grep-mode-hook 'my-grep-mode-init)
;; ----------------------------------------------------------------------
;; * [2011-09-02 金] grep buffer に switch する。 grep buffer がない場合は grep 開始する。
(defun my-grep-or-switch-to-buffer ()
  "Switch to *grep* buffer, or run `grep'."
  (interactive)
  (if (get-buffer "*grep*")
      (switch-to-buffer-other-window "*grep*")
    (call-interactively 'grep)))
(global-set-key (kbd "M-s g") 'grep)
(global-set-key (kbd "M-s l") 'lgrep)
(global-set-key (kbd "M-s r") 'rgrep)
(global-set-key (kbd "M-g M-s g") 'my-grep-or-switch-to-buffer)
(global-set-key (kbd "M-g M-s l") 'my-grep-or-switch-to-buffer)
(global-set-key (kbd "M-g M-s r") 'my-grep-or-switch-to-buffer)
;; grep 系は使い物にならない。 (kbd "M-s M-d") を moccur-grep に譲る。
;; ----------------------------------------------------------------------
