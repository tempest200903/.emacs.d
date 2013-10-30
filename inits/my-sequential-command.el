;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-sequential-command.el
;; =============================================================================
;; http://d.hatena.ne.jp/rubikitch/20090219/sequential_command
;; インストール
;; M-x install-elisp http://www.emacswiki.org/cgi-bin/wiki/download/sequential-command.el
;; M-x install-elisp http://www.emacswiki.org/cgi-bin/wiki/download/sequential-command-config.el
;; ----------------------------------------------------------------------
;; ~/.emacs.d/auto-install/sequential-command.el
;; For example, defining `my-end': if point is at the end of line, go
;; to the end of buffer, otherwise go to the end of line. Just evaluate it!
;;
;; (define-sequential-command my-end  end-of-line end-of-buffer)
;; (global-set-key "\C-e" 'my-end)
;; ----------------------------------------------------------------------
;; ~/.emacs.d/auto-install/sequential-command-config.el
;;  `sequential-command-setup-keys'
;;    Rebind C-a, C-e, M-u, M-c, and M-l to seq-* commands.
;; ----------------------------------------------------------------------
;;
(when (not (require 'sequential-command nil t))
  (progn
    (install-elisp-from-emacswiki "sequential-command.el")
    (when (not (require 'sequential-command-config nil t))
      (install-elisp-from-emacswiki "sequential-command-config.el")
      )
    )
  )
;;
(when (require 'sequential-command nil t)
  (when (require 'sequential-command-config nil t)
    (progn
      (global-set-key (kbd "C-z C-a") 'beginning-of-line)
      (global-set-key (kbd "C-z C-e") 'end-of-line)
      (global-set-key (kbd "C-e") 'seq-end)
      (global-set-key (kbd "C-a") 'seq-home)
      (when (boundp 'org-mode-map)
        (define-key org-mode-map (kbd "C-a") 'org-seq-home)
        (define-key org-mode-map (kbd "C-e") 'org-seq-end))
      (define-key esc-map "u" 'seq-upcase-backward-word)
      (define-key esc-map "c" 'seq-capitalize-backward-word)
      (define-key esc-map "l" 'seq-downcase-backward-word)
      )
    )
  )
