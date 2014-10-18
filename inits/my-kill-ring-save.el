;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-09-12
;; my-kill-ring-save.el
;; ======================================================================

(require 'my-elisp-lang)

;; * [2012-01-27 金] mark-active かそうでないかで2種類の動作をする。
;; my-ffap-copy-string-as-kill.el と同様。
(defun my-kill-ring-save-or-ffap-copy-string-as-kill (&optional univ-arg)
  "if mark-active then kill-ring-save else ffap-copy-string-as-kill."
  (interactive)
  (if mark-active
      (kill-ring-save (mark) (point))
    (ffap-copy-string-as-kill)))

;; ----------------------------------------------------------------------
;; * [2014-09-30 火] 実現したいことは
;; C-z C-: 1回目で my-kill-buffer-file-name,
;; 2回目で my-kill-buffer-base-name,
;; 3回目で my-kill-buffer-dir-name


(defun home-directory ()
  "return home directory"
  ;; replace-regexp-in-string しなくても abbreviate-file-name で十分。
  (replace-regexp-in-string "\\\\" "/" (getenv "HOME"))
  )

(defun kill-new-and-message (string-arg)
  "do kill-new and message"
    (kill-new string-arg)
    (message string-arg)
  )

(defun cleansed-file-name (&optional univ-arg)
  (if univ-arg
      (buffer-file-name)
    (abbreviate-file-name (buffer-file-name))
    )
  )

(defun cleansed-base-name (&optional univ-arg)
  (file-name-nondirectory (cleansed-file-name univ-arg))
  )

(defun cleansed-dir-name (&optional univ-arg)
  (file-name-directory (cleansed-file-name univ-arg))
  )

(defun my-kill-buffer-file-name (&optional univ-arg)
  "kill buffer-file-name. unless univ-arg is 4 then replace HOME to ~."
  (interactive "P")
  (when mark-active (kill-ring-save (mark) (point)))
  (kill-new-and-message (cleansed-file-name univ-arg))
  )

(defun my-kill-buffer-base-name (&optional univ-arg)
  "kill buffer-base-name. unless univ-arg is 4 then replace HOME to ~."
  (interactive "P")
  (when mark-active (kill-ring-save (mark) (point)))
  (kill-new-and-message (cleansed-base-name univ-arg))
  )

(defun my-kill-buffer-dir-name (&optional univ-arg)
  "kill buffer-dir-name. unless univ-arg is 4 then replace HOME to ~."
  (interactive "P")
  (when mark-active (kill-ring-save (mark) (point)))
  (kill-new-and-message (cleansed-dir-name univ-arg))
  )

(define-sequential-command my-seq-kill-buffer-file-name
  my-kill-buffer-file-name
  my-kill-buffer-base-name
  my-kill-buffer-dir-name
  )

;; * TODO dired でも my-kill-buffer-file-name を使いたい。
;; ----------------------------------------------------------------------
;; * wishlist
;; ** [2014-09-18 木] TODO file-name を扱うコマンド全般について、
;; cygpath -w 形式と cygpath -u 形式を使い分けたい。
;; (defun my-cygpath-toggle ... )
;; ** [2014-09-18 木] kill-ring に入っている path を
;; cygpath -w 形式または cygpath -u 形式に変換するコマンド。
;; 明示的にどちらの形式にするか選択するか、
;; 実行するたびに自動判別して他方で出力する。
;; ** [2014-09-18 木] 特別なコマンドを実行しなくても kill する時点で
;; 事前に選択した形式に自動的に変換する minor-mode
;; Windows アプリケーション( Excel など)や外部(Redmine)
;; に貼り付けるときは、これがあると便利。
;; prefer-coding-system のような感じ。
;; ** [2014-09-18 木] region に登場する path を一括変換するコマンド。
;; ----------------------------------------------------------------------
;; ~/.emacs.d/memo/my-emacs-customize.org.txt
;; *** TODO 〔ffap-copy-string-as-kill 不具合〕
;;     [2011-12-27 火 11:15]
;; - "N:\I......e\プ. . . . . \■......\シ. . . . . \4.. . \イ. . . . . . . . . \コ. . . . . . . . . . . 〉.xls"
;;   の先頭で ffap-copy-string-as-kill すると、
;;   "N:\I.......\プ. . . . . \" までしか選択しない。
;; - [[C:\temp\a\b\プロジェクト\■関東]]
;;   の先頭で ffap-copy-string-as-kill すると、
;;   "C:\temp\a\b\プロジェクト" までしか選択しない。
;; org link のリンク先を確実に読み取るコマンドがほしい。

(defun scan-url-or-line ()
  "point 位置に URL がある場合は URL を返す。 else point 位置にある行を返す。"
  (or
   (ffap-url-at-point)
   (thing-at-point 'line)
   )
  )

(defun scan-link-target (line)
  "link-target を抽出する。 line が http で始まる場合、 line を返す。
   line が [[ ... ]] を含む場合、 ... を返す。
   "
  (cond
   ;; ((string-match (concat "^http.*://") line) line)
   ((string/starts-with line "http://") line)
   ((string/starts-with line "https://") line)
   ((string/starts-with line "ftp://") line)
   ((string-match "\\[\\[\\(.*\\)\\]\\]" line) (match-string 1 line))
   (t nil)
    )
  )

(defun my-copy-org-link-target ()
  "org link のリンク先を読み取って kill-ring-save する"
  (interactive)
  (let* (
         (line          (scan-url-or-line))
         (link-target   (scan-link-target line))
         )
    (message "link-target =: {%s}" link-target)
    (kill-new link-target)
    link-target
    )
  )
;; * [2014-10-18 土] TODO [[file://fs/{4}/資料][file://fs/{4}/資料]] 形式のリンクを変換する。
;; 1. file: をはずす。
;; 2. / を \ に置換する。
;; 3. {4} を [4] に置換する。

(defun my-kill-ring-save-or-copy-org-link-target (&optional univ-arg)
  "1. リージョンがアクティブならリージョンを kill-ring-save 。
   2. リージョンが非アクティブかつ org link があるなら my-copy-org-link-target 。
   3. いずれでもなければ ffap-copy-string-as-kill 。
   "
  (interactive)
  (if mark-active
      (kill-ring-save (mark) (point))
    (my-copy-org-link-target)
    )
  )

(require 'my-os-type)

(defun my-copy-org-link-target-and-w32-shell-execute ()
  "org link のリンク先を読み取って kill-ring-save し、w32-shell-execute する。"
  (interactive)
  (let* (
         (line          (scan-url-or-line))
         (link-target   (scan-link-target line))
         )
    (message "link-target =: {%s}" link-target)
    (kill-new link-target)
    link-target
    (when (os-win?)
      (shell-command (format "C:/Cygwin/bin/cygstart.exe %s" link-target))
      )
    )
  )

;; ** [2014-10-07 火] TODO DRY! my-copy-org-link-target-and-w32-shell-execute の前半は my-copy-org-link-target と同じ。
;; ** [2014-10-07 火] TODO ファイルが存在しないと失敗する。ファイルが存在しないことが分かるように表示してほしい。

;; ----------------------------------------------------------------------
(provide 'my-kill-ring-save) ;; goto my-autoload.el
;; ----------------------------------------------------------------------
