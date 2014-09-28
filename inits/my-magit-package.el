;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-magit-package.el
;; #+LAST_UPDATED: 2014-09-28
;; ======================================================================
;; * [2014-09-28 日] 導入
;; http://qiita.com/takc923/items/c7a11ff30caedc4c5ba7
;; EmacsのGitクライアント：Magit - Qiita

(when (package-require 'magit nil nil t)

  (defun my-magit-process () ""
    (interactive)
    (let ((buffer-name "*magit-process*"))
      (if (get-buffer buffer-name)
          (switch-to-buffer-other-window buffer-name)
        (magit-status)
        )
      )
    )

  (bind-key "C-x m s" 'magit-status)
  (bind-key "C-x m c" 'magit-commit)
  (bind-key "C-x m p" 'my-magit-process)

  )
