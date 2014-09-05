;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-date.el
;; =============================================================================
;; TODO "d2014-04-15" を1日後の "d2014-04-16" に置換する。
;; TODO "d2014-04-15" を7日後の "d2014-04-22" に置換する。
;; TODO リージョン範囲が有効な場合、置換範囲を限定する。
;; TODO x日後を argument で指定する。例 C-u 7 M-x my-date-replace
;; ----------------------------------------------------------------------
;; TODO (query-replace FROM-STRING TO-STRING &optional DELIMITED START END)
;; FROM-STRING
;;   1. ポイント位置から読み取る。
;;   2. 読み取れない場合、代わりに昨日の日付を用いる。
;;   3. 1. or 2. を interactive のデフォルト値にする。
;; TO-STRING
;;   1. argument なしの場合、 FROM-STRING に1加算する。ただし、営業日以外はスキップする。
;;   2. argument ありの場合、 FROM-STRING に argument 加算する。
;; ----------------------------------------------------------------------
(defun my-date-insert-today() "今日の日付を挿入する"
  (interactive)
  (setq today-date-string (format-time-string "%Y-%m-%d" (current-time)))
  (message today-date-string)
  (insert-for-yank today-date-string)
  )
;; ----------------------------------------------------------------------
(defun my-date-insert-yesterday() "【未完成】昨日の日付を挿入する"
  (interactive)
  (setq time (decode-time (current-time))) ;; timeに現在時刻をデコードしてセット
  (setq number -1)
  (setf (elt time 3) (+ (elt time 3) number)) ;; 日付をnumber日後にする
  (setq yesterday-date-string (format-time-string "%Y-%m-%d" time))
  (message yesterday-date-string)
  (insert-for-yank yesterday-date-string)
  )
;; ----------------------------------------------------------------------
(defun my-date-replace-today(to-date) "選択文字列を指定した日付に置換する。"
  (interactive "sDate (default is today): ") 
  ;; 置換元文字列
  (if mark-active (kill-ring-save (region-beginning) (region-end)))
  (setq from-string (current-kill 0))
  ;; 置換先文字列
  (if (string= "" to-date)
      (setq to-date (format-time-string "%Y-%m-%d" (current-time)))
    )
  ;; 時間実行
  (message (concat "(query-replace \"" from-string "\" \"" to-date "\")"))
  (query-replace from-string to-date)
  )
;; ----------------------------------------------------------------------
;; 参考
;;
;; http://d.hatena.ne.jp/myhobby20xx/20110316/1300290575
;; 　emacsで日付計算するときに必要になりそうだったのでメモ
;; (setq time (decode-time (current-time))) ;; timeに現在時刻をデコードしてセット
;; (setf (elt time 3) (+ (elt time 3) 1)) ;; 日付を明日にする
;; (decode-time (apply 'encode-time time)) ;; 明日の日付をデコードして取得
;; (format-time-string "%Y/%m/%d" (apply 'encode-time time)) ;; %Y/%m/%d形式にして取得
;; ----------------------------------------------------------------------
(provide 'my-date)
