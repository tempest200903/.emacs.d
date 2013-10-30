;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-08-30 火] popwin.el 導入 
;; http://d.hatena.ne.jp/m2ym/20110120/1295524932
;; http://valvallow.blogspot.jp/2011/03/emacs-popwinel.html
;; * [2011-08-31 水] カスタマイズ popwin:special-display-config
;; 初期値は(("*Help*")
;; ("*Completions*" :noselect t)
;; ("*compilation*" :noselect t)
;; ("*Occur*" :noselect t))
(when (require 'popwin nil t)
  (setq display-buffer-function 'popwin:display-buffer)
  (setq popwin:special-display-config '(("*Help*")
                                        ("*Completions*" :noselect t)
                                        ("*compilation*" :noselect t)
                                        ;; ("*Occur*" :noselect t)
                                        ("*Buffer List*")
                                        ("*Messages*")
                                        ("*grep*")
                                        (";Open Recent")
                                        (dired-mode :position top)
                                        ("*Backtrace*")
                                        ;; ("*Org Agenda*")
                                        ("*Apropos*")
                                        ("*Warnings*")
                                        ;; ("*bm-bookmarks*") ;; see my-elpa-bm.el
                                        ))
  (when (require 'dired-x nil t)
    (push '(dired-mode :position top) popwin:special-display-config)
    ;; M-x dired-jump-other-window すると dired のバッファをポップアッ
    ;; プ表示できます。
    )
  (defun popwin:find-file-makefile () ""
    (interactive)
    (popwin:find-file "Makefile")
    )
  (defun popwin:find-file-changelog () ""
    (interactive)
    (popwin:find-file "Changelog")
    )
  (define-key global-map (kbd "M-s M-k") 'popwin:stick-popup-window)
  (define-key global-map (kbd "M-s M-2") 'popwin:display-last-buffer)
  (define-key global-map (kbd "M-s m") 'popwin:messages)
  (define-key global-map (kbd "M-s c") 'popwin:find-file-changelog)
  (define-key global-map (kbd "M-s m") 'popwin:find-file-makefile)
  (define-key dired-mode-map "f" #'(lambda ()
                                     (interactive)
                                     (popwin:find-file (dired-get-file-for-visit))))
  )
;; ----------------------------------------------------------------------
;; * [2011-09-26 月]
;; TODO "*Messages*", "A-Open Recent" が popwin 対象にならない。なぜ？
;; ----------------------------------------------------------------------
;; http://valvallow.blogspot.jp/2011/03/emacs-popwinel.html
;; 対象のファイルを popup で表示するようにしました。
;; たくさんのファイル（例えば自動で保存してある *scratch* バッファの
;; 履歴とか）を一つ一つ確認するのが大変で困っていたのが、
;; これまた大変快適になりました。
;; (require 'popwin)
;; (defvar popwin:special-display-config-backup popwin:special-display-config)
;; (setq display-buffer-function 'popwin:display-buffer)
;; (setq popwin:special-display-config
;;       (append '(("*Remember*" :stick t)("*Org Agenda*")("*Backtrace*")
;;                 ("*sdic*" :noselect))
;;               popwin:special-display-config))
;; (define-key global-map (kbd "C-x p") 'popwin:display-last-buffer)
;; (define-key dired-mode-map "o" #'(lambda ()
;;                                    (interactive)
;;                                    (popwin:find-file (dired-get-file-for-visit))))
;; (key-chord-define-global "mn" 'popwin:messages)
;; ----------------------------------------------------------------------
