;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-02-07
;; ======================================================================
;; cf. url: http://www24.atwiki.jp/myfavoritepcsettings/pages/156.html
;; 
;; emacsclientw.exe で開いたバッファを閉じるときに以下のような警告が出
;; るのが邪魔な場合は、.emacs にそれを回避する設定を追加するBuffer
;; `hogehoge' still has clients; kill it? (yes or no)
(server-start)
(remove-hook 'kill-buffer-query-functions
	     'server-kill-buffer-query-function)

