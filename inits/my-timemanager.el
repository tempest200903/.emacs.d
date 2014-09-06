;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2014-08-07
;; my-workmanager.el
;; ======================================================================

(defun my-workmanager-write-file ()
  "org-agenda 1日分をファイルに保存する。"
  (interactive)
  (let* (
         (file-path "n:/work/myscript/ruby/workmanager_time_collect_input.txt")
         )
    (find-file file-path)
    (kill-buffer) ;; 前回作ったバッファを始末する。
    (write-file file-path nil)
  )
  (org-agenda-mode)
  (rename-buffer (concat (buffer-name) " " "<>") t)
  ;; (rename-buffer (concat (buffer-name) " " (number-to-string org-starting-day)) t)
  )

;; [2014-07-03 木]
;; 1. (shell-command "n:/work/myscript/ruby/workmanager_time_collect.bat") かつ、 workmanager_time_collect.bat から emacs 以外のエディタを起動すると、 emacs がハングアップしない。
;; 2. (shell-command "n:/work/myscript/ruby/workmanager_time_collect.bat") かつ、 workmanager_time_collect.bat から emacsclient を起動すると、 emacs がハングアップする。
;; 3. (shell-command "N:/tool/bluewind/bluewind.exe /paste n:/work/myscript/ruby/workmanager_time_collect.bat") かつ、 workmanager_time_collect.bat から emacsclient を起動すると、 emacs がハングアップしない。
(defun my-workmanager-collect ()
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

(defun my-workmanager-init ()
  "my-workmanager 初期化"
  ;; default org-agenda-sunrise-sunset を上書きする。
  (define-key org-agenda-mode-map (kbd "S") 'my-workmanager-write-file) 
  ;; default org-agenda-convert-date を上書きする。
  (define-key org-agenda-mode-map (kbd "C") 'my-workmanager-collect) 
  )

(add-hook 'org-agenda-mode-hook 'my-workmanager-init)

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
