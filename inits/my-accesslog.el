;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-accesslog.el

;; ======================================================================
;; * [2014-10-05 日] 〔org-open-at-point アクセスログ〕

(require 'my-psession-package)

;; これを psession-object-to-save-alist に追加する。
;; (describe-variable 'psession-object-to-save-alist)
(defvar my-accesslog-database-file-path nil "アクセスログデータベース ファイルパス") 

(defun my-accesslog-init ()
  "アクセスログデータベースを初期化する"
  (setq my-accesslog-database-file-path (make-hash-table :test 'equal))
  )
(my-accesslog-init)

(defun my-accesslog-increment (int-value-or-nil) "整数インクリメント。 nil を入力したら 1 を返す。"
  (if int-value-or-nil
      (+ 1 int-value-or-nil)
    1)
  )

(defun my-accesslog-countup (target-file-name)
  "org-open-at-point でジャンプ先のファイルのアクセスログを記録する。
   target-file-name : ジャンプ元のファイル。
  "
  (let* (
         (before-increment-value (gethash target-file-name my-accesslog-database-file-path))
         (access-count (my-accesslog-increment before-increment-value))
         )
    (puthash target-file-name access-count my-accesslog-database-file-path)
    (message "#my-accesslog-countup# %s:%s" target-file-name access-count)
    )
  )

(defadvice org-open-file (after org-open-file-after activate)
  (let (
        (path (ad-get-arg 0))
        )
    (my-accesslog-countup path)
    )
  )

(defun my-accesslog-database-show ()
  (interactive)
  (message (print-hash my-accesslog-database-file-path))
  )

;; ----------------------------------------------------------------------

;; http://d.hatena.ne.jp/rubikitch/20100201/elispsyntax
;; ハッシュの値を表示するために自分で関数を定義する必要がある
(defun print-hash (hash)
  (with-temp-buffer
    (loop initially (insert "{")
          for k being the hash-keys in hash using (hash-values v) do
          (insert " " (prin1-to-string k) " => " (prin1-to-string v) ",")
          finally   (delete-backward-char 2) (insert " }"))
    (buffer-string)))

;; ----------------------------------------------------------------------
;; (describe-function 'org-open-at-point)
;; org-open-at-point is an interactive compiled Lisp function in
;; `org.el'.
;; (org-open-at-point &optional ARG REFERENCE-BUFFER)
;; Open link at or after point.
;; If there is no link at point, this function will search forward up to
;; the end of the current line.
;; Normally, files will be opened by an appropriate application.  If the
;; optional prefix argument ARG is non-nil, Emacs will visit the file.
;; With a double prefix argument, try to open outside of Emacs, in the
;; application the system uses for this file type.
