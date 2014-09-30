;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-setq.el
;; ======================================================================
;; * [2010-10-18 月] "yes or no"を"y or n"に
;; cf. url: http://e-arrows.sakura.ne.jp/2010/02/vim-to-emacs.html
(fset 'yes-or-no-p 'y-or-n-p)
;; ------------------------------------------------------------------
;; ;; * [2010-10-18 月] ;; cf. WEB+DB PRESS Vol.58 ;; url:
;; http://gihyo.jp/magazine/wdpress/archive/2010/vol58 ;; p.77 フレーム
;; タイトルを変更する。;; ;; ** 変更前のデフォルト値は;;
;; frame-title-format is a variable defined in `C source code'.  ;;
;; Its value is ;; "%f - Emacs@DEV-ISFACTORY5" ;; ;; ** ファイルフルパ
;; ス名を表示する。;; (setq frame-title-format (format "%%f -
;; Emacs@%s" (system-name))) ;; バッファ名とファイルフルパス名を表示す
;; る。;; Emacs version を表示する。(setq frame-title-format (format
;; "%%b - '%%f' - Emacs%s@%s" emacs-version (system-name))) ;; ;;
;; ------------------------------------------------------------------
;; * [2010-10-18 月] cf. url:
;; http://e-arrows.sakura.ne.jp/2010/02/vim-to-emacs.html
;; 2行ずつスクロール(setq scroll-conservatively 35 scroll-margin 0 scroll-step 2)
;; ----------------------------------------------------------------------------
;; * [2010-10-18 月] カラム番号をモードラインに表示する。
;; cf. WEB+DB PRESS Vol.58 url:
;; http://gihyo.jp/magazine/wdpress/archive/2010/vol58 ;;; 特集2 思考を
;; 直感的にコード化し，開発を加速する Emacs活用∞（無限大）;;;
;; cf. page.77 表示に関する設定をする;; (column-number-mode 1) ;;
;; ~/.emacs.d/my-emacs-custom.el で設定済み。;;
;; ------------------------------------------------------------ ;; *
;; [2011-11-14 月] ファイルの新規作成時に使用するテキストエンコーディン
;; グを指定する;; http://sourceforge.jp/magazine/09/04/23/0834240/5 ;;
;; 「prefer-coding-system」という、ファイルの新規作成時に使用するテキス
;; トエンコーディングを指定するコマンドがある。起動時にこのコマンドに
;; 「utf-8-unix」という値を与えて実行させるには、次のように記述すればよ
;; い。
;; (prefer-coding-system 'utf-8-unix)
;; 実験結果。
;; (prefer-coding-system 'utf-8-unix) にすると、マルチバイトファイル名
;; を使った M-x org-open-at-point {It is bound to C-c C-o} が失敗す
;; る。
;; default-file-name-coding-system Its value is utf-8-unix 
;; になっている。これが問題か？
;;
;; http://d.hatena.ne.jp/end0tknr/20110903/1315042315
;;
;; default-file-name-coding-systemで emacsの日本語ファイル名の文字化け
;; 解消 - end0tknrのkipple
;; 普段、win xp + emacs 23を利用していますが、
;; 通常?の.emacsでは、dired modeで日本語のファイル名が文字化けしてしま
;; います。
;; そのような場合、.emacsのprefer-coding-system の後に
;; default-file-name-coding-system を .emacsに追加しましょう。
;;
;; (prefer-coding-system 'utf-8-unix) ; 日本語入力のための設定
;; (setq default-file-name-coding-system 'shift_jis) ;diredで日本語file名出
;; 力
;; この方法で解消した。(prefer-coding-system 'utf-8-unix) ; 日本語
;; 入力のための設定(setq default-file-name-coding-system 'shift_jis)
;; diredで日本語file名出力
;; ----------------------------------------------------------------------
;; BSで選択範囲を消す (delete-selection-mode t)
;; 誤って消して気づかない事故が多発したので、無効にする。
(delete-selection-mode -1)
;; ----------------------------------------------------------------------
;; * [2014-05-08 木] http://d.hatena.ne.jp/web7_77/20110705/1309885434
;; org-open-at-point したときに、リンク先バッファで元いた位置からリンク
;; 先位置までを選択してリージョンアクティブになる現象が発生。このまま文
;; 字入力するとリージョンを削除してしまうので困る。これを防ぐため、
;; org-open-at-point 直後に set-mark-command を2回実行する。試してみた
;; が、なぜかリージョンアクティブを解除できない。とりあえず、
;; (delete-selection-mode -1) を入れてリージョンを削除しないようにして
;; おく。
(delete-selection-mode -1)
;; ----------------------------------------------------------------------
;; * [2014-07-29 火]
;; - http://www.emacswiki.org/emacs/MidnightMode
;;   # If you want to have “midnight” occur multiple times a day, you can change the ‘midnight-period’ from 24 hours to something else.
;;   # (setq midnight-period 7200) ;; (eq (* 2 60 60) "2 hours")
;;   - midnight-period に customize はない。 init.el で設定しておくべし。
(when (require 'midnight nil)
  (setq midnight-period (* 4 60 60))
  )
;; ----------------------------------------------------------------------
;; * [2014-09-27 土] https://github.com/znz/dot-emacs/blob/8434c73ba833791eedc1411360e10441e52b370e/init.el.d/10gc.el
;; GC の頻度調整
(setq gc-cons-threshold 52428800)
;; メッセージを minibuf に出す。
(setq garbage-collection-messages t)
;; ----------------------------------------------------------------------
;; * [2014-09-27 土] https://github.com/znz/dot-emacs/blob/8434c73ba833791eedc1411360e10441e52b370e/init.el.d/50face.el
;;; M-x list-face-display のサンプル文字列
(setq list-faces-sample-text
      "漢字ひらがなカタカナﾊﾝｶｸｶﾅabcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLMNOPQRSTUVWXYZ_-")
;; https://github.com/znz/dot-emacs/blob/8434c73ba833791eedc1411360e10441e52b370e/init.el.d/50frame.el
(setq-default indicate-empty-lines t)
(setq-default indicate-buffer-boundaries 'right)
;; ----------------------------------------------------------------------
;; * [2014-09-28 日] https://github.com/znz/dot-emacs/blob/8434c73ba833791eedc1411360e10441e52b370e/init.el.d/50window.el
;; helpなどのwindowを自動的にリサイズ
(temp-buffer-resize-mode t)
;; ----------------------------------------------------------------------
;; * [2014-09-30 火] iswitchb-mode
;; cf. https://gist.github.com/kawacho/264d31130a10c7f2ed77
(iswitchb-mode +1)
