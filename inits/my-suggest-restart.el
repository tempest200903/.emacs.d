;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; * [2012-01-04 水] 
(when nil
  (auto-install-from-url "https://raw.github.com/gist/1513345/80a45e7b25f4c52c135c86a6ec3225a659f45cac/suggest-restart.el")
  )
;; n:/download/Emacs/plugin/github/suggest-restart/suggest-restart.el
;; Emacsのメモリ使用量をチェックして，上限を越えていたら再起動をおすすめする
;; デフォルト設定では閾値は500MBを越えているかを，600秒ごとにチェック
;; 変えたければsuggest-restart:threshold，suggest-restart:intervalを変える
;; (suggest-restart t) で開始
(setq suggest-restart:interval 60)
(setq suggest-restart:threshold 5000)
(suggest-restart t)
(suggest-restart nil)
;; [2012-05-23 水 15:03] windows では機能しないようだ。


