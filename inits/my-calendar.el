;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2012-06-27
;; ======================================================================
;; * [2011-10-28 金] カレンダーのカスタマイズ
;; http://www.fan.gr.jp/~ring/doc/elisp_20/elisp_40.html#SEC645
;; 
;; 変数view-diary-entries-initiallyにtを設定しておくと, カレンダーを呼び出すと現在の日に対する日誌記録を自動的に表示できます. その日がウィンドウで見える場合に限って日誌記録が表示されます. つぎの行,
;; (setq view-diary-entries-initially t)
;; (calendar)
;; を個人のファイル`.emacs'に入れておくと, Emacsを起動するたびに, カレンダーと日誌の両者のウィンドウを表示します.
;; 同様に, 変数view-calendar-holidays-initiallyに tを設定しておくと, カレンダーに入ると自動的に3か月分の祝祭日一覧を表示します. 祝祭日一覧は別のウィンドウに現れます.
;; 変数mark-diary-entries-in-calendarにtを設定すると, 日誌に入れてある日付に印を付けられます. カレンダーのウィンドウ内容を再計算するときにこの効果が現れます. これらの日付に印を付ける方法は2つあります. ディスプレイで使えるならばフェイス（see section フェイス）を変更するか, 日付にプラス記号（`+'）を付加します.
;; 同様に, 変数mark-holidays-in-calendarにtを設定すると, フェイスを変えるかアスタリスク（`*'）を付加することで 祝祭日に印を付けられます.
;; ----------------------------------------------------------------------
;; (describe-variable 'view-diary-entries-initially)
;; This variable is an alias for `calendar-view-diary-initially-flag'.
;; This variable is obsolete since 23.1;
;; use `calendar-view-diary-initially-flag' instead.
;; ----------------------------------------------------------------------
;; (describe-variable 'calendar-view-diary-initially-flag)
;; Its value is nil
;; Documentation:
;; Non-nil means display current date's diary entries on entry to calendar.
;; The diary is displayed in another window when the calendar is first displayed,
;; if the current date is visible.  The number of days of diary entries displayed
;; is governed by the variable `diary-number-of-entries'.  This variable can
;; be overridden by the value of `calendar-setup'.
;; You can customize this variable.
;; [2011-10-28 金] M-x customize '(calendar-view-diary-initially-flag t) 
;; ----------------------------------------------------------------------
;; (describe-variable 'view-calendar-holidays-initially)
;; This variable is an alias for `calendar-view-holidays-initially-flag'.
;; This variable is obsolete since 23.1;
;; use `calendar-view-holidays-initially-flag' instead.
;; ----------------------------------------------------------------------
;; (describe-variable 'calendar-view-holidays-initially-flag)
;; Its value is nil
;; Documentation:
;; Non-nil means display holidays for current three month period on entry.
;; The holidays are displayed in another window when the calendar is first
;; displayed.
;; You can customize this variable.
;; [2011-10-28 金] M-x customize '(calendar-view-holidays-initially-flag nil) 
;; ----------------------------------------------------------------------
;; (describe-variable 'mark-diary-entries-in-calendar)
;; This variable is an alias for `calendar-mark-diary-entries-flag'.
;; This variable is obsolete since 23.1;
;; use `calendar-mark-diary-entries-flag' instead.
;; ----------------------------------------------------------------------
;; (describe-variable 'calendar-mark-diary-entries-flag)
;; calendar-mark-diary-entries-flag is a variable defined in `calendar.el'.
;; Its value is nil
;; Documentation:
;; Non-nil means mark dates with diary entries, in the calendar window.
;; The marking symbol is specified by the variable `diary-entry-marker'.
;; You can customize this variable.
;; [2011-10-28 金] M-x customize '(calendar-mark-diary-entries-flag t) 
;; ----------------------------------------------------------------------
;; [2011-10-28 金] M-x customize '(diary-file "~/howm/2011/diary-y2011.txt")
;; ----------------------------------------------------------------------
;; Emacs 起動直後にやりたい動作があればここに記す。
;; calendar-today-marker
;; (calendar)
;; (when (require 'org nil t)
;;   (when (require 'org-agenda nil t)
;;     (org-goto-calendar)
;;     )
;;   )
;; ----------------------------------------------------------------------
