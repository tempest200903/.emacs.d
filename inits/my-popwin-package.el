;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-popwin.el
;; ======================================================================
;; * [2011-08-30 火] popwin.el 導入
;; http://d.hatena.ne.jp/m2ym/20110120/1295524932
;; http://valvallow.blogspot.jp/2011/03/emacs-popwinel.html
;; ----------------------------------------------------------------------
;; * [2014-09-12 金] インストール手順: package-require 式を eval-last-sexp する。
(when (and
       (package-require 'popwin nil nil t)
       t)
  (when (require 'my-use-package nil t)
    (use-package popwin
      :config (progn
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
                (defun popwin:dired-get-file-for-visit () ""
                  (interactive)
                  (popwin:find-file (dired-get-file-for-visit))
                  )
                )
      :bind (
             ;;; autoload 記述不要。 (define-key global-map (kbd "M-s M-k") 'popwin:stick-popup-window) と同等。
             ("M-s M-k" . popwin:stick-popup-window)
             ;;; autoload 記述不要。 (define-key global-map (kbd "M-s M-s") 'popwin:display-last-buffer)
             ("M-s l" . popwin:display-last-buffer)
             ;;; autoload 記述不要。 (define-key global-map (kbd "M-s e") 'popwin:messages)
             ("M-s e" . popwin:messages)
             ;;; autoload 記述不要。 (define-key global-map (kbd "M-s c") 'popwin:find-file-changelog)
             ("M-s c" . popwin:find-file-changelog)
             ;;; autoload 記述不要。 (define-key global-map (kbd "M-s m") 'popwin:find-file-makefile)
             ("M-s m" . popwin:find-file-makefile)
             )
      ) ;; use-package
    ) ;; (when @2
  ) ;; (when @1
;; ----------------------------------------------------------------------
;; * [2011-09-26 月]
;; TODO "*Messages*", "A-Open Recent" が popwin 対象にならない。なぜ？
;; ----------------------------------------------------------------------
;; * [2011-09-26 月]
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
(provide 'my-popwin)
;; ----------------------------------------------------------------------
