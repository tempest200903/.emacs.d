;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2013-11-05
;; #+TITLE: my-anything-c-moccur.el
;; ============================================================================
;; * [2011-05-12 木] anything-c-moccur.el 導入
;; 前提: color-moccur
;; url: http://d.hatena.ne.jp/IMAKADO/20080724/1216882563
;; url: http://svn.coderepos.org/share/lang/elisp/anything-c-moccur/trunk/anything-c-moccur.el
;; from: N:\download\Emacs\plugin\svn.coderepos.org\anything-c-moccur\anything-c-moccur.el
;; to: N:\.emacs.d\elisp\anything-c-moccur.el
;; 
;; 以下は、設定サンプルです。
;;
;; ;;; color-moccur.elの設定
;; (require 'color-moccur)
;; ;; 複数の検索語や、特定のフェイスのみマッチ等の機能を有効にする
;; ;; 詳細は http://www.bookshelf.jp/soft/meadow_50.html#SEC751
;; (setq moccur-split-word t)
;; ;; migemoがrequireできる環境ならmigemoを使う
;; (when (require 'migemo nil t) ;第三引数がnon-nilだとloadできなかった場合にエラーではなくnilを返す
;;   (setq moccur-use-migemo t))
;;
;; ;;; anything-c-moccurの設定
;; (require 'anything-c-moccur)
;; ;; カスタマイズ可能変数の設定(M-x customize-group anything-c-moccur でも設定可能)
;; (setq anything-c-moccur-anything-idle-delay 0.2 ;`anything-idle-delay'
;;       anything-c-moccur-higligt-info-line-flag t ; `anything-c-moccur-dmoccur'などのコマンドでバッファの情報をハイライトする
;;       anything-c-moccur-enable-auto-look-flag t ; 現在選択中の候補の位置を他のwindowに表示する
;;       anything-c-moccur-enable-initial-pattern t) ; `anything-c-moccur-occur-by-moccur'の起動時にポイントの位置の単語を初期パターンにする
;;
;; ;;; キーバインドの割当(好みに合わせて設定してください)
;; (global-set-key (kbd "M-o") 'anything-c-moccur-occur-by-moccur) ;バッファ内検索
;; (global-set-key (kbd "C-M-o") 'anything-c-moccur-dmoccur) ;ディレクトリ
;; (add-hook 'dired-mode-hook ;dired
;;           '(lambda ()
;;              (local-set-key (kbd "O") 'anything-c-moccur-dired-do-moccur-by-moccur)))
;;
;; anything-c-moccurのカスタマイズ変数の設定は
;;
;; M-x customize-group anything-c-moccur
;;
;; でも可能です。
;; ----------------------------------------------------------------------
;; * [2013-11-05 火] インストール手順。
;; (auto-install-from-url "http://svn.coderepos.org/share/lang/elisp/anything-c-moccur/trunk/anything-c-moccur.el")
;; この URL は消失しているようだ。
;; copy N:\download\Emacs\plugin\svn.coderepos.org\anything-c-moccur\anything-c-moccur.el ~/.emacs.d/manual-install
;; ----------------------------------------------------------------------
(require 'color-moccur)
(setq moccur-split-word t) ;; default
(require 'anything-c-moccur)
(setq anything-c-moccur-anything-idle-delay 0.2 ;`anything-idle-delay'
      anything-c-moccur-higligt-info-line-flag t ; `anything-c-moccur-dmoccur'などのコマンドでバッファの情報をハイライトする
      anything-c-moccur-enable-auto-look-flag t ; 現在選択中の候補の位置を他のwindowに表示する
      anything-c-moccur-enable-initial-pattern t) ; `anything-c-moccur-occur-by-moccur'の起動時にポイントの位置の単語を初期パターンにする
(define-key my-anything-map (kbd "C-m") 'anything-c-moccur-occur-by-moccur)
(define-key my-anything-map (kbd "d") 'anything-c-moccur-dmoccur)

;; TODO keybind を整理する。
;; 第2プレフィクスを定義する。
;; my-anithing-keymap.el に移動する。
;; C-; C-o => occur カレントバッファ 関連
;; C-; C-d => occur ディレクトリ 関連
;; C-; C-m => occur マルチバッファ 関連
;; 通常コマンドのキーバインドの直前にプレフィクス C-; をつけると anything コマンドになるように定義する。
;; ただし、 ctrl および meta は融通する。
;; 例
;;   M-s M-o => occur
;;   C-; C-o => anything-occur
;;   M-s M-i => imenu
;;   C-; C-i => anything-imenu

;; * [2011-05-12 木] 第1印象
;; M-x anything-occur `anything-config.el' は以前から使っていた。 M-x anything-c-moccur-occur-by-moccur はどこが違う？
;; M-x anything-c-moccur-dmoccur はディレクトリ対象なので便利。
;; M-x anything-c-moccur-dired-do-moccur-by-moccur はまだ試していない。
;; 
;; goto [[n:/.emacs.d/memo/cheatsheet-emacs.org.txt]]

;; * [2011-12-19 月] cheatsheet, Q and A
;; ** M-x anything-c-moccur-occur-by-moccur
;; バッファ内検索; 日本語検索成功
;; ** M-x anything-c-moccur-dmoccur
;; ディレクトリ; 日本語検索失敗
;; emacs の auto save file も検索対象に入れてしまう。 例: #my-color-moccur.el#
;; ack のように除外ファイル名を指定したい。
;; サブディレクトリは検索対象にしたいが、ならない。
