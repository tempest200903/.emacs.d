;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-color-theme.el
;; ======================================================================
;; * [2011-11-22 火] 終了時にテーマを保存
;; http://www.bookshelf.jp/soft/meadow_26.html#SEC309

(setq theme-load-from-file t)
(setq theme-default 'color-theme-standard)

(defun my-onload()
  (setq filename (concat (expand-file-name "~") "/.curTheme"))
  (if (file-exists-p filename)
      (progn
        (message "selecting theme from .curTheme")
        (load-file filename)
        (color-theme-install (my-color-theme))
        (my-color-theme)
        )
    (funcall theme-default)
    (message "selecting theme from color-theme-standard")
    (color-theme-install (color-theme-standard))
    (color-theme-standard)))

(defun my-kill-saves()
  (if theme-load-from-file
      (progn
        (color-theme-print)
        (write-file  (concat (expand-file-name "~") "/.curTheme")))))

(my-onload)
(add-hook 'kill-emacs-hook 'my-kill-saves)

(when t
  (add-hook 'before-make-frame-hook 'color-theme-standard)
  (remove-hook 'before-make-frame-hook 'color-theme-standard)
  )

