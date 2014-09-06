;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-color-moccur.el
;; ----------------------------------------------------------------------
;; * [2010-11-04 月]
;; インストール。
;; cf. WEB+DEB PRESS Vol.58 p.80 color-moccur 検索結果をリストアップ
;; 記事では auto-install を使っているが、今は package がある。
;; M-x package-list-package color-moccur
;; M-x package-install color-moccur
(if (require 'color-moccur nil t)
  (progn
    (setq moccur-split-word t) ;; スペース区切りで AND 検索
    ;; dmoccur-exclusion-mask ディレクトリ検索のとき除外するファイル
    (add-to-list 'dmoccur-exclusion-mask "\\.DS_Store")
    (add-to-list 'dmoccur-exclusion-mask "^#.+#$")
    (add-to-list 'dmoccur-exclusion-mask ".svn")
    (add-to-list 'dmoccur-exclusion-mask ".git")
    )
  (progn
    (message "failed require 'color-moccur")
    )
  (defun my-moccur-today (arg) "今日の日付で moccur する"
    (interactive "p")
    (setq today-date-string (format-time-string "%Y-%m-%d" (current-time)))
    (moccur today-date-string nil)
    )
  )
;; ----------------------------------------------------------------------
(provide 'my-color-moccur)
;; ----------------------------------------------------------------------
;; color-moccur is an installed package.

;;      Status: Installed in `n:/tool/gnupack/gnupack_devel-11.00/home/.emacs.d/elpa/color-moccur-20120811.527/'.
;;     Version: 20120811.527
;;     Summary: multi-buffer occur (grep) mode

;; If this program doesn't run, I might change the program for the
;; worse.  So please send mail to akihisa@mail.ne.jp .
;; This elisp is the extention of moccur.el.
;; Thanks to the authors for writing moccur.el
;; With color-moccur, you can search a regexp in all buffers. And you
;; can search files like grep(-find) without grep (and find) command.

;; $Id: color-moccur.el,v 2.71 2010-05-06 13:40:54 Akihisa Exp $

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 3, or (at
;; your option) any later version.

;; This program is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;; for hi-lock
;; Hi-lock: (("^;;; .*" (0 (quote hi-black-hb) t)))
;; Hi-lock: (("^;;;; .*" (0 (quote hi-black-b) t)))
;; Hi-lock: (("make-variable-buffer-\\(local\\)" (0 font-lock-keyword-face)(1 'italic append)))
;; Hi-lock: end

;; [back]
