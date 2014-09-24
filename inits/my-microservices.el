;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-microservices.el
;; #+LAST_UPDATED: 2014-09-21
;; ======================================================================
;; ~/.emacs.d/memo/emacs-bug-history.org.txt
;; - [2014-09-06 土] に my-init.el をリセットしてからしばらくは不具合発生しなかった。
;; - その後、徐々に elisp を増やしていた。今日、不具合発生した。
;;   - IME変換中の文字列が別フレームに書き込まれる不具合
;;   - 文字が正しく描画されない不具合。 make-frame-command などで描画し直せば解消するが不便。
;; - どの elisp が原因なのか特定できていない。
;; - 対処案
;;   - 起動直後は elisp load を最小限にしておく。
;;   - 必要になった時点で load する。どの elisp を load してあるかを記録しておく。
;;   - 不具合発生したら load 記録を保存する。 emacs 再起動。
;;   - この測定を数日継続する。記録を見て原因となりうる elisp を絞り込む。
;; - 仕組みを作る。
;; - 考え方は Microservices に似ている。
;;   - cf. http://deeeet.com/writing/2014/09/10/microservices/
;;   - cf. http://martinfowler.com/articles/microservices.html
;; ----------------------------------------------------------------------
;; 1. モノリシック elisp file をなるべく最小限に分割する。
;; 2. micro elisp file それぞれに load されたときに自分自身の名前をデータベースに記録する。
;;    データベースはとりあえず単純な CSV でいいか。 
;;    elisp で S 式をファイルに永続化／復元するのに便利な関数はあるか？ custom-save-all ？
;; 3. 依存関係ツリーが入り組んでいて把握しずらくなる。
;;    Maven dependency-tree のような仕組みがほしい。 Graphviz でグラフを描くか？
;; ----------------------------------------------------------------------
;; 
(defvar my-microservices-database-file "~/.emacs.d/microservices.csv")
(defvar my-microservices-database-buffer-name "microservices.csv")
;;
;; (defadvice FUNCTION ARGS &rest BODY) 
;; (load FILE &optional NOERROR NOMESSAGE NOSUFFIX MUST-SUFFIX)
(defadvice load (after my-microservices-load activate)
  "elisp が load されたときに自分自身の名前をデータベースに記録する。"
  (let ((a0 (ad-get-arg 0))) ; load の第1引数 FUNCTION を読む。
    (message "[my-microservices-load] %s" a0)
    (if (not (get-buffer my-microservices-database-buffer-name))
        (message "[my-microservices-load] failed get-buffer")
        (switch-to-buffer my-microservices-database-buffer-name)
        (insert-for-yank "a\n")
      )
    )
  )
(find-file-other-window my-microservices-database-file)
;; ----------------------------------------------------------------------
(provide 'my-microservices)
;; ----------------------------------------------------------------------
;; デバッグ用。
(when nil
  (progn
    (defun a () "" (interactive) (load "my-org-countdown.el"))
    (define-key global-map (kbd "<f8>") 'my-eval-buffer-or-region)
    (define-key global-map (kbd "<f9>") 'a)
    )
  )
