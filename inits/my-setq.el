;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-setq.el
;; ======================================================================
;; * [2010-10-18 月]
;; cf. url: http://e-arrows.sakura.ne.jp/2010/02/vim-to-emacs.html
;; "yes or no"を"y or n"に
(fset 'yes-or-no-p 'y-or-n-p)
;;
;; ------------------------------------------------------------------
;; * [2010-10-18 月]
;; cf. url: http://e-arrows.sakura.ne.jp/2010/02/vim-to-emacs.html
;; 対応するカッコをハイライト
(show-paren-mode 1)
;;
;; ------------------------------------------------------------------
;; ;; * [2010-10-18 月]
;; ;; cf. WEB+DB PRESS Vol.58
;; ;; url: http://gihyo.jp/magazine/wdpress/archive/2010/vol58
;; ;; p.77 フレームタイトルを変更する。
;; ;;
;; ;; ** 変更前のデフォルト値は
;; ;; frame-title-format is a variable defined in `C source code'.
;; ;; Its value is
;; ;; "%f - Emacs@DEV-ISFACTORY5"
;; ;;
;; ;; ** ファイルフルパス名を表示する。
;; ;; (setq frame-title-format (format "%%f - Emacs@%s" (system-name)))
;; ;; バッファ名とファイルフルパス名を表示する。
;; ;; Emacs version を表示する。
;; (setq frame-title-format
;;       (format "%%b - '%%f' - Emacs%s@%s"
;;               emacs-version
;; 	      (system-name)))
;; ;;
;; ;; ------------------------------------------------------------------
;; ;; * [2010-10-18 月]
;; ;; cf. url: http://e-arrows.sakura.ne.jp/2010/02/vim-to-emacs.html
;; ;; 2行ずつスクロール
;; (setq scroll-conservatively 35
;;       scroll-margin 0
;;       scroll-step 2)
;; ;; ----------------------------------------------------------------------------
;; ;; * [2010-10-18 月]
;; ;; カラム番号をモードラインに表示する。
;;  ;;; cf. WEB+DB PRESS Vol.58 url: http://gihyo.jp/magazine/wdpress/archive/2010/vol58
;;  ;;; 特集2 思考を直感的にコード化し，開発を加速する Emacs活用∞（無限大）
;;  ;;; cf. page.77 表示に関する設定をする
;; ;; (column-number-mode 1)
;; ;; ~/.emacs.d/my-emacs-custom.el で設定済み。
;; ;; ------------------------------------------------------------
;; ;; (setenv "PATH" (concat (getenv "PATH") ";N:\\tool\\emacs-23.2\\bin"))
;; ;; ----------------------------------------------------------------------
;; ;; * [2011-11-14 月] ファイルの新規作成時に使用するテキストエンコーディングを指定する
;; ;; http://sourceforge.jp/magazine/09/04/23/0834240/5
;; ;; 「prefer-coding-system」という、ファイルの新規作成時に使用するテキストエンコーディングを指定するコマンドがある。起動時にこのコマンドに「utf-8-unix」という値を与えて実行させるには、次のように記述すればよい。
;; ;; (prefer-coding-system 'utf-8-unix)
;; ;; 実験結果。
;; ;; (prefer-coding-system 'utf-8-unix) にすると、マルチバイトファイル名を使った M-x org-open-at-point {It is bound to C-c C-o} が失敗する。
;; ;; default-file-name-coding-system Its value is utf-8-unix
;; ;; になっている。これが問題か？
;; ;; http://d.hatena.ne.jp/end0tknr/20110903/1315042315
;; ;; default-file-name-coding-systemで emacsの日本語ファイル名の文字化け解消 - end0tknrのkipple
;; ;; 普段、win xp + emacs 23を利用していますが、通常?の.emacsでは、dired modeで日本語のファイル名が文字化けしてしまいます。
;; ;; そのような場合、.emacsのprefer-coding-system の後にdefault-file-name-coding-system を .emacsに追加しましょう。
;; ;; (prefer-coding-system 'utf-8-unix)	; 日本語入力のための設定
;; ;; (setq default-file-name-coding-system 'shift_jis) ;diredで日本語file名出力
;; ;; この方法で解消した。
;; (prefer-coding-system 'utf-8-unix)	; 日本語入力のための設定
;; (setq default-file-name-coding-system 'shift_jis) ;diredで日本語file名出力
;; ;;----------------------------------------------------------------------
;; ;; * [2012-02-27 月] debug
;; (setq debug-on-error nil)
;; ;; ----------------------------------------------------------------------
;; ;; 部分一致の補完機能を使う
;; ;; p-bでprint-bufferとか
;; ;; (partial-completion-mode t)
;; ;; GNU Emacs 24.1.1 では *Warning* Symbol's function definition is void: partial-completion-mode
;; ;; ----------------------------------------------------------------------
;; ;; BSで選択範囲を消す
;; (delete-selection-mode t)
;; ;; ----------------------------------------------------------------------
;; ;; [2013-09-12 木] setenv
;; (setenv "GRAPHVIZ_DOT" "C:\\tool\\Graphviz2.30\\bin\\dot.exe")
