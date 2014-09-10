;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-japanese-holidays.el
;; ======================================================================
;; * [2014-09-11 木] インストール
;; (package-install 'japanese-holidays)
;; ----------------------------------------------------------------------
;; * [2014-09-11 木] 設定
;; ~/.emacs.d/vendor/elpa/japanese-holidays-readme.txt
;;
(eval-after-load "holidays"
  '(progn
     (require 'japanese-holidays)
     (setq calendar-holidays ; 他の国の祝日も表示させたい場合は適当に調整
           (append japanese-holidays local-holidays other-holidays))
     (setq mark-holidays-in-calendar t) ; 祝日をカレンダーに表示
     ;; 土曜日・日曜日を祝日として表示する場合、以下の設定を追加します。
     ;; 変数はデフォルトで設定済み
     (setq japanese-holiday-weekend '(0 6)     ; 土日を祝日として表示
           japanese-holiday-weekend-marker     ; 土曜日を水色で表示
           '(holiday nil nil nil nil nil japanese-holiday-saturday))
     (add-hook 'calendar-today-visible-hook 'japanese-holiday-mark-weekend)
     (add-hook 'calendar-today-invisible-hook 'japanese-holiday-mark-weekend)
     ;; “きょう”をマークするには以下の設定を追加します。
     (add-hook 'calendar-today-visible-hook 'calendar-mark-today)))
;;
;; ----------------------------------------------------------------------
;; * [2014-09-11 木] TODO 固有の稼働日、非稼働日を設定したい。
