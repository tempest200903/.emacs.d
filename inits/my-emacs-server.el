;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-emacs-server.el
;; #+LAST_UPDATED: 2014-04-15
;; ======================================================================
;; cf. url: http://www24.atwiki.jp/myfavoritepcsettings/pages/156.html
;; 
;; emacsclientw.exe で開いたバッファを閉じるときに以下のような警告が出
;; るのが邪魔な場合は、.emacs にそれを回避する設定を追加するBuffer
;; `hogehoge' still has clients; kill it? (yes or no)
;;
;; cf. https://gist.github.com/kawacho/264d31130a10c7f2ed77
;; 
(require 'server)
(unless (server-running-p)
  (server-start))
(remove-hook 'kill-buffer-query-functions
	     'server-kill-buffer-query-function)

;; バッチファイル N:\tool\gnupack\gnupack_devel-11.00\app\emacs\emacs\bin\client.bat %*
