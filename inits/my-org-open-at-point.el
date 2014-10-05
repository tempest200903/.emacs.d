;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-org-open-at-point.el

;; ======================================================================
;; * [2014-10-05 〔org-open-at-point アクセスログ〕

(require 'psession)

(defvar my-org-open-at-point-accesslog-hash-table nil "アクセスログデータベース")

(defun my-org-open-at-point-accesslog-init ()
  "アクセスログデータベースを初期化する"
  (setq my-org-open-at-point-accesslog-hash-table (make-hash-table :test 'equal))
  )

(defun increment (int-value-or-nil) "整数インクリメント。 nil を入力したら 1 を返す。"
  (if int-value-or-nil
      (+ 1 int-value-or-nil)
    1)
  )

(defun my-org-open-at-point-accesslog-countup ()
  "org-open-at-point でジャンプ先のファイルのアクセスログを記録する"
  (let* (
        (source-file-name (buffer-file-name)) ; ジャンプ元のファイル。
        (access-count (increment (gethash source-file-name my-org-open-at-point-accesslog-hash-table)))
        )
    (puthash source-file-name 1 my-org-open-at-point-accesslog-hash-table)
    (message "## %s:%s" source-file-name access-count)
    )
  )

(add-hook 'org-follow-link-hook 'my-org-open-at-point-accesslog-countup)

;; http://d.hatena.ne.jp/rubikitch/20100201/elispsyntax
;; ハッシュの値を表示するために自分で関数を定義する必要がある
(defun print-hash (hash)
  (with-temp-buffer
    (loop initially (insert "{")
          for k being the hash-keys in hash using (hash-values v) do
          (insert " " (prin1-to-string k) " => " (prin1-to-string v) ",")
          finally   (delete-backward-char 2) (insert " }"))
    (buffer-string)))
(print-hash my-org-open-at-point-accesslog-hash-table)

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
