;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-09-03
;; バックアップ関連。
;; ======================================================================
;; * [2010-10-25 月]
;; cf. url: http://www.bookshelf.jp/soft/meadow_24.html#SEC261
;; この設定だと，すべてのバックアップファイルが ~/bak に保存されます．
;; * customize "Make Backup Files"
(setq make-backup-files t)
;; * customize "Backup Directory Alist" では実現が難しいので elisp で行う。
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/bak"))
	    backup-directory-alist))


;; - auto-save-mode on で \\isf-mine にあるファイルを auto-save すると、応答なしになる。
;; - auto-save-mode off で様子を見る。
(auto-save-mode -1)
