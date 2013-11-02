;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-dired-mode-hook.el
;; #+LAST_UPDATED: 2013-11-03
;; ======================================================================
;; [2013-10-15] http://qiita.com/kbkbkbkb1/items/13585a5711d62e9800ef
;; Emacs のバッファ名にヒントを追加する - Qiita [キータ]
(defun my-dired-my-append-buffer-name-hint ()
  "Append a auxiliary string to a name of dired buffer."
  (when (eq major-mode 'dired-mode)
    (let* ((dir (expand-file-name list-buffers-directory))
           (drive (if (and (eq 'system-type 'windows-nt) ;; Windows の場合はドライブレターを追加
                           (string-match "^\\([a-zA-Z]:\\)/" dir))
                      (match-string 1 dir) "")))
      (rename-buffer (concat (buffer-name) " [" drive "Dired]") t))))
(add-hook 'dired-mode-hook 'my-dired-my-append-buffer-name-hint)
;; ----------------------------------------------------------------------
