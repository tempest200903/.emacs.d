;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-compile.el
;; =============================================================================
;; - M-x compile などで開始したサブプロセスを強制終了したい。
;;   - 今回、サブプロセスが1時間経過しても終了していなかった。
;; - M-x eval-expression (M-:) などで以下の式を eval すればよい。
;;   - (delete-process "*compilation*")
;;   - 第1引数はバッファ名。
;; - 終了後、バッファに "Compilation killed" と表示されていたら終了できているはず。
;; - cf. http://www.fan.gr.jp/~ring/doc/elisp_19/elisp-jp_35.html#SEC509
;;   - list-processes このコマンドは、アクティブなすべてのプロセスの一覧を
;;     表示します。 さらに、ステータスが`Exited'または`Signaled'のプロセス
;;     を最終的に削除します。この関数はnilを返します。
(defun stop-compilation () "stop *compilation*"
  (interactive)
  (delete-process "*compilation*")
  )
