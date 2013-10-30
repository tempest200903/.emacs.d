;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; * [2012-06-12 火] copy from ~/.emacs.d/gnupack-init.el 
;; "GNU Emacs 23.3.1 (i386-mingw-nt5.1.2600) of 2011-08-15 on GNUPACK" に付属していた init.el を待避したもの。
;; ------------------------------------------------------------------------
;; @ migemo/cmigemo
   (setq migemo-command (concat (getenv "INST_DIR")
                                "\\app\\cmigemo\\cmigemo"))
   (setq migemo-options '("-q" "--emacs"))
   (setq migemo-dictionary (concat (getenv "INST_DIR")
                                   "\\app\\cmigemo\\dict\\utf-8\\migemo-dict"))
   (setq migemo-user-dictionary nil)
   (setq migemo-regex-dictionary nil)
   (setq migemo-use-pattern-alist t)
   (setq migemo-use-frequent-pattern-alist t)
   (setq migemo-pattern-alist-length 1024)
   (setq migemo-coding-system 'utf-8-unix)
   (load-library "migemo")
   (migemo-init)
;; ------------------------------------------------------------------------
;; * [2012-06-15 金]
;; my-migemo を load した場合。 C-^ s runs the command
;; howm-list-grep-fixed コマンドで homwS バッファを作るところまでは正常。
;; *howmS* で <down> 数回すると howmC バッファがおかしくなる。
;; * [2013-08-19 月]
;; init.el ロード完了後に、 (load "~/.emacs.d/inits/my-migemo.el") 。そのあと、 howm-list-grep-fixed は正常動作する。
;; ~/.emacs.d/my-init.el に (load "~/.emacs.d/inits/my-migemo" 'noerror) を追加して様子を見る。
;; ----------------------------------------------------------------------
;; (apropos-command "migemo")
;; howm-list-migemo              C-c , m, C-^ m
;;    (not documented)
;; migemo-backward               M-x ... RET
;;    (not documented)
;; migemo-dabbrev-expand         M-x ... RET
;;    (not documented)
;; migemo-expand-pattern         M-x ... RET
;;    Expand the Romaji sequences on the left side of the cursor
;; migemo-forward                M-x ... RET
;;    (not documented)
;; migemo-frequent-pattern-make  M-x ... RET
;;    Create frequent pattern from `frequent-chars'.
;; migemo-isearch-toggle-migemo  M-x ... RET
;;    Toggle migemo mode in isearch.
;; migemo-isearch-yank-char      M-x ... RET
;;    Pull next character from buffer into search string with migemo.
;; migemo-isearch-yank-line      M-x ... RET
;;    Pull next character from buffer into search string with migemo.
;; migemo-isearch-yank-word      M-x ... RET
;;    Pull next character from buffer into search string with migemo.
;; migemo-kill                   M-x ... RET
;;    Kill migemo process
;; migemo-pattern-alist-clear    M-x ... RET
;;    Clear migemo alist data & file.
;; migemo-pattern-alist-save     M-x ... RET
;;    Save migemo alist file.
;; migemo-toggle-isearch-enable  M-x ... RET
;;    (not documented)

(global-set-key (kbd "C-z C-x C-s")     'migemo-isearch-toggle-migemo)
