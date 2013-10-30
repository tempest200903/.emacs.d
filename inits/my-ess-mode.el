;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-11-09 水] ESS

(setq emacs22-p (string-match "^22" emacs-version)
      emacs23-p (string-match "^23" emacs-version)
      emacs23.0-p (string-match "^23\.0" emacs-version)
      emacs23.1-p (string-match "^23\.1" emacs-version)
      emacs23.2-p (string-match "^23\.2" emacs-version)
      emacs23.3-p (string-match "^23\.3" emacs-version)
      )

(when emacs23.3-p
  (if (require 'ess-sp6w-d nil t)
      (progn (message "ess-sp6w-d:TRUE")
             ;; モードラインの文字の色を設定します。
             (set-face-foreground 'modeline "white")
             ;; モードラインの背景色を設定します。
             (set-face-background 'modeline "MediumPurple4")
             ;; 文字の色を設定します。
             (add-to-list 'default-frame-alist '(foreground-color . "gray10"))
             ;; 背景色を設定します。
             (add-to-list 'default-frame-alist '(background-color . "white"))
             )
    (progn (message "ess-sp6w-d:FALSE"))
    )
  )
