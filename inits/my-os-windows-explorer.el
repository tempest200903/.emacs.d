;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-os-windows-explorer.el
;; #+LAST_UPDATED: 2014-09-23
;; ----------------------------------------------------------------------
(require 'my-os-type)
(when (os-win?)
  ;;
  ;; http://www.bookshelf.jp/soft/meadow_25.html#SEC282
  ;;
  (defun my-unix-to-dos-filename (filename)
    ""
    (replace-regexp-in-string "/" "\\\\" filename)
    )
  (defun my-dired-open-by-w32-shell ()
    "dired で選択したファイルをシェル(エクスプローラ関連づけ)で開く"
    (interactive)
    (let ((file (dired-get-filename)))
      (w32-shell-execute "open" file)
      )
    )
  (defvar my-xdoc2txt-executable "C:/tool/xdoc2txt/command/xdoc2txt.exe")
  (defvar my-cygstart-executable "C:/tool/bluewind/bluewind.exe /paste")
  (defun my-dired-open-by-xdoc2txt ()
    "dired で選択したファイルを xdoc2txt でテキストファイルに変換して開く"
    (interactive)
    (let* (
          (file (dired-get-filename))
          (file-txt (replace-regexp-in-string ".pdf" ".txt" file))
          )
      (if (file-directory-p file)
          (w32-shell-execute "open" file)
        (compile
         (concat my-xdoc2txt-executable
                 " " file " > " file-txt " && "
                 my-cygstart-executable " " file-txt)
         )
        ;; (find-file file-txt)
        ;; compile の直後に find-file しても、まだ compile プロセスが終わっていないと開くのに失敗する。
        ;; compile が終わったときに実行する関数を格納する変数 compilation-finish-functions がある。
        ;; とりあえず、単純に compile のコマンドに " && " を連結しておく。
        )
      )
    )
  ;; デフォルトの O dired-do-chown を上書き。
  (bind-key "O" 'my-dired-open-by-w32-shell dired-mode-map)
  ;; デフォルトの O dired-do-chgrp を上書き。
  (bind-key "G" 'my-dired-open-by-xdoc2txt dired-mode-map)
  )
;; ----------------------------------------------------------------------
(provide 'my-os-windows-explorer)
