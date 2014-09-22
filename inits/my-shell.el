;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-11-09
;; my-shell.el
;; ======================================================================
;; * [2014-09-22 月] ~/.emacs.d/gnupack-init.el から移植した。
;; *shell* バッファで bash: $'exit\r': コマンドが見つかりません という不具合を回避するために必要。
;;
(require 'shell)
(setq explicit-shell-file-name "bash.exe")
(setq shell-command-switch "-c")
(setq shell-file-name "bash.exe")

;; (M-! and M-| and compile.el)
(setq shell-file-name "bash.exe")
(modify-coding-system-alist 'process ".*sh\\.exe" 'cp932)

;; shellモードの時の^M抑制
(add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)

;; shell-modeでの補完 (for drive letter)
(setq shell-file-name-chars "~/A-Za-z0-9_^$!#%&{}@'`.,;()-")

;; エスケープシーケンス処理の設定
(autoload 'ansi-color-for-comint-mode-on "ansi-color"
  "Set `ansi-color-for-comint-mode' to t." t)

(setq shell-mode-hook
      (function
       (lambda ()
         ;; シェルモードの入出力文字コード
         (set-buffer-process-coding-system 'sjis-dos 'sjis-unix)
         (set-buffer-file-coding-system    'sjis-unix)
         )))
;; ----------------------------------------------------------------------
;; * [2011-11-04 金] bash と cmd を共存する。
;; - 現象 M-x shell を実行すると、シェルが実行されない。 *Messages* には "apply: Spawning child process: invalid argument" と出力する。
;; - デフォルトでは /bin/bash を起動しようとするが Windows にはこれがないので失敗する。
;; - C-h v explicit-shell-file-name customize "C:/WINDOWS/system32/cmd.exe" を指定すれば解消する。
;; - C-h v explicit-shell-file-name customize "C:/cygwin/bin/bash.exe" を指定するとどうなる？ 実験結果 bash が使える！
;; - cmd と bash を使い分けたい。どうすればできるか？

(when nil

  (defun shell-cmd-sjis () "shell using cmd with sjis 【未完成】 実行すると emacs クラッシュ"
    (interactive)

    ;; (universal-coding-system-argument CODING-SYSTEM) を参考にした。
    (let local-coding-system
      (let ((coding-system-for-read local-coding-system)
            (coding-system-for-write local-coding-system)
            (coding-system-require-warning t)
            )
        (message "")
        (let* ((explicit-shell-file-name "C:/WINDOWS/system32/cmd.exe"))
          (call-interactively 'shell)
          )
        )
      )
    )

  (defun shell-cmd () "shell using cmd"
    (interactive)
    (let* ((explicit-shell-file-name "C:/WINDOWS/system32/cmd.exe"))
      (call-interactively 'shell)
      )
    )

  (defun shell-bash () "shell using bash"
    (interactive)
    (let* ((explicit-shell-file-name "C:/cygwin/bin/bash.exe"))
      (call-interactively 'shell)
      )
    )

  (global-set-key (kbd "M-s M-h") 'shell)
  )

;; ======================================================================
;; 最後に実行したコマンドを再実行する。

(when nil
  (fset 'shell-repeat-last-command
        (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([escape 33 134217840 return] 0 "%d")) arg)))
  (global-set-key (kbd "M-s M-1") 'shell-repeat-last-command)
  )

;; ======================================================================
;; * [2012-07-23 月] pcomplete.el
;; 45.4 カスタマイズ可能な shell 補完機能 ― pcomplete (2003/10/20)
;; http://www.bookshelf.jp/soft/meadow_45.html#SEC675
(when nil
  (add-hook 'shell-mode-hook 'pcomplete-shell-setup)
  )
;; pcomplete-shell-setup 実行前。 "make -" は補完される。 "csv " は補完されない。
;; pcomplete-shell-setup 実行後。 "make -", "csv " は補完されない。
;; とりあえず無効にしておく。
