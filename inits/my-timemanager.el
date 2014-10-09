;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2014-08-07
;; my-timemanager.el
;; ======================================================================

;; (defun my-find-file-and-clear (filepath)
;;   (find-file file-path)
;;   (mark-whole-buffer)
;;   (when buffer-read-only (toggle-read-only))
;;   (kill-region (mark) (point))
;;   )

(defun my-timemanager-write-file ()
  "org-agenda 1日分をファイルに保存する。欠点： org file にジャンプできない。"
  (interactive)
  (let* (
         (file-path "n:/work/myscript/ruby/workmanager_time_collect_input.txt")
         (register-name "t")
         )
    (mark-whole-buffer)
    (copy-to-register (get-register register-name) (mark) (point))
    (find-file file-path)
    (kill-buffer (get-buffer file-path))
    (delete-file file-path)
    (find-file file-path)
    (insert-register (get-register register-name))
    (save-buffer nil)
    (toggle-read-only 1)
    )
  (org-agenda-mode)
  )

;; ** [2014-10-08 水] TODO 事前に file-path の中身を空にするべし。

;; ----------------------------------------------------------------------

;; ** [2014-07-03 木]
;; 1. (shell-command "n:/work/myscript/ruby/workmanager_time_collect.bat") かつ、 workmanager_time_collect.bat から emacs 以外のエディタを起動すると、 emacs がハングアップしない。
;; 2. (shell-command "n:/work/myscript/ruby/workmanager_time_collect.bat") かつ、 workmanager_time_collect.bat から emacsclient を起動すると、 emacs がハングアップする。
;; 3. (shell-command "N:/tool/bluewind/bluewind.exe /paste n:/work/myscript/ruby/workmanager_time_collect.bat") かつ、 workmanager_time_collect.bat から emacsclient を起動すると、 emacs がハングアップしない。
(defun my-timemanager-collect ()
  "ファイルを読み取って集計する。 n:/work/myscript/ruby/workmanager_time_collect.bat"
  (interactive)
  (let* (
         (launcher-command "N:/tool/bluewind/bluewind.exe /paste")
         (batch-file "n:/work/myscript/ruby/workmanager_time_collect.bat")
         (command-batch-file (concat launcher-command " " batch-file))
         )
    (shell-command command-batch-file)
    )
  )

;; ----------------------------------------------------------------------
;; * [2013-11-07 木] TODO バッファ名に日付を付与するべし。
;; workmanager_time_collect_input.txt を 20131107-workmanager_time_collect_input.txt に変更。
;; 保存するファイル名は固定。
;; バッファ変数 org-starting-day に選択した日付が入っている。
;; 例
;; Friday      4 7月 2014
;; org-starting-day 735418
;; Thursday    3 7月 2014
;; org-starting-day 735417
;; この数値は西暦1/1/1を基点にしている。
;; $ date -d '735417 days ago'
;; Mon Jan  1 10:58:54     0001
;; 人が読める形式に変換する。
;; cf. http://qiita.com/yewton@github/items/5e134065a9d4478b27d2
;; ----------------------------------------------------------------------
;; * [2014-08-07 木] TODO バッファを後始末する。
;; my-workmanager-write-file

;; ----------------------------------------------------------------------
;; * [2014-09-25 木] TODO write-file するついでに sn か en にも保存する。

;; ----------------------------------------------------------------------
;; * [2014-10-03 金] TODO close になったプロジェクトを抽出して表示する。
;; 例 (progn (switch-to-buffer (get-buffer "*Org Agenda*")) (foreign-regexp/occur "Clocked:.*(WMP140011|WMP140084|WMP140125|WMP140081)"))

(defun my-timemanager-show-closed-project ()
  "close になったプロジェクトを抽出して表示する。"
  (interactive)
  (let ((regexp-closed-project "Clocked:.*:\(WMP140011\|WMP140084\|WMP140125\|WMP140081\):"))
    (when (switch-to-buffer (get-buffer "*Org Agenda*"))
      (my-org-agenda-show-log-on)
      (occur regexp-closed-project)
      (when t (highlight-regexp regexp-closed-project "hi-yellow")) ; org-agenda-mode では highlight できない？
      )
    )
  )

(defun my-org-agenda-show-log-on ()
  "もし org-agenda-show-log が on でなければ on にする"
  (when (not org-agenda-show-log)
    (org-agenda-log-mode)
    )
  )
