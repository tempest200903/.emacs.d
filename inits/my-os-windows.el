;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2012-05-23
;; ----------------------------------------------------------------------
(require 'my-os-type)
(when (os-win?)
  (defvar SC_MAXIMIZE 61488)
  (defvar SC_RESTORE 61728)
  (defvar *wm-message* SC_MAXIMIZE)
  (defun my-frame-maximize ()
    (interactive)
    (w32-send-sys-command *wm-message*)
    (setq *wm-message* (if (eq *wm-message* SC_MAXIMIZE) SC_RESTORE SC_MAXIMIZE))
    )
  (defun my-maximize-frame ()
    "Maximize frame"
    (interactive)
    (w32-send-sys-command SC_MAXIMIZE)
    )
  (defun my-resize-frame ()
    "resize the window via keyboard"
    (interactive)
    (w32-send-sys-command 61440)
    )
  (defun my-restore-current-frame ()
    "restore current frame"
    (interactive)
    (w32-send-sys-command SC_RESTORE)
    )
  (defun my-seq-my-maximize-or-restore-frame ()
    "Maximize frame"
    (interactive)
    (my-maximize-frame)
    )
  (when (require 'sequential-command nil t)
    (when (require 'sequential-command-config nil t)
      (progn
        (define-sequential-command my-seq-my-maximize-or-restore-frame
          my-maximize-frame my-restore-current-frame)
        )
      )
    )
  )
;; ----------------------------------------------------------------------
(provide 'my-os-windows)
;; ----------------------------------------------------------------------
;; * [2010-10-14 木] 導入。
;; cf. url: http://www.geocities.co.jp/SiliconValley-SanJose/7474/EmacsCustomize.html
;; ウィンドウの最大化/解除をキーに割り当ててみる（トグルする）
;; #define SC_MINIMIZE     0xF020 61472
;; #define SC_MAXIMIZE     0xF030 61488
;; #define SC_NEXTWINDOW   0xF040
;; #define SC_PREVWINDOW   0xF050
;; ...
;; #define SC_RESTORE      0xF120 61728
;; ----------------------------------------------------------------------
;; * [2012-03-19 月] その他。
;; http://www.emacswiki.org/emacs/WThirtyTwoSendSysCommand
;; w32-send-sys-command Codes
;; 61440 - resize the window via keyboard
;; 61456 - move window via keyboard
;; 61472 - minimize current frame
;; 61488 - maximize current frame
;; 61504 - next window (not very practical)
;; 61520 - previous window (not very practical)
;; 61536 - close the window (this will quit the application)
;; 61552 - vertical scroll – doesn’t seem to do anything for me
;; 61568 - horizontal scroll – doesn’t seem to do anything for me
;; 61584 - mouse menu(?) – doesn’t seem to do anything for me
;; 61696 - activate menubar (will not de-activate it, though)
;; 61712 - arrange(?) – doesn’t seem to do anything for me
;; 61728 - restore current frame
;; 61744 - simulate pressing Windows Start button
;; 61760 - activate screensaver
;; 61776 - hotkey(?) – doesn’t seem to do anything for me
;; ----------------------------------------------------------------------
