;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; =============================================================================
(when (require 'flymake nil t)

  ;; [2012-05-22 火 12:41] 実験中。 コマンドへのPATHを通す。
  ;; (setenv "PATH" (concat (getenv "PATH") ";C:\\Program Files\\PHP\\php"))
  ;; (setq exec-path (append exec-path '("C:\\Program Files\\PHP\\php")))
  ;; (setenv "PATH" (concat (getenv "PATH") ";C:\\Program Files\\PHP\\php"))
  ;; (setq exec-path (append exec-path '("/cygdrive/c/Program Files/PHP/php")))

  ;; GUIの警告は表示しない
  (setq flymake-gui-warnings-enabled nil)

  ;; 全てのファイルで flymakeを有効化
  (add-hook 'find-file-hook 'flymake-find-file-hook)

  ;; M-p/M-n で警告/エラー行の移動
  (define-key php-mode-map (kbd "C-M-p") 'flymake-goto-prev-error)
  (define-key php-mode-map (kbd "C-M-n") 'flymake-goto-next-error)

  ;; 警告エラー行の表示
  (global-set-key (kbd "C-c d") 'flymake-display-err-menu-for-current-line)

  )

(flymake-mode -1)
