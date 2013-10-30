;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-package.el
;; =============================================================================
;; http://blog.goo.ne.jp/sohgoh/e/3f7e4278b37c42e934736de76bf0bf9b
;; インストール手順
;; 1. bash
;; 2. cd ~/.emacs.d
;; 3. make package
;;
;; .emacsを開いた状態で以下を実行します。（.emacs.d/vender/elpaディレクトリ作成等が実行されます）
;; M-x eval-current-buffer
;; 正常に実行できたら(エラーが起きなければ)、実際にリポジトリに接続してリストを取得します。
;; M-x package-list-packages
;; ----------------------------------------------------------------------
;; * [2012-05-31 木] 『Emacs実践入門』 p.116
;; - 『Emacs実践入門』 p.116 package .el
;; - M-x install-elisp RET http://bit.ly/pkg-el23 RET
;; URL リダイレクト先 http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el
;; ----------------------------------------------------------------------
;; * [2012-06-07 木] 『Software Design』 p.128
;; 外部のリポジトリ1 Marmalade http://marmalade-repo.org/
;; 外部のリポジトリ2 MELPA http://melpa.milkbox.net/
;; (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
;; MELPA については http://d.hatena.ne.jp/tuto0621/20120613/1339607400 にも記述がある。
;;     (add-to-list 'package-archives '("MELPA" . "http://melpa.milkbox.net/packages/"))
(when (not (require 'package nil t))
  (progn
    (message "require package false")
    (message "see my-package.el how to install")
    (install-elisp "http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el")
    (message "~/.emacs.d/auto-install/package.el")
    )
  )
(when (require 'package nil t)
  (progn
    (message "require package true")
    ;;リポジトリにMarmaladeを追加
    (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
    (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
    (add-to-list 'package-archives '("MELPA" . "http://melpa.milkbox.net/packages/"))
    ;;インストールするディレクトリを指定
    (setq package-user-dir (concat user-emacs-directory "vendor/elpa"))
    ;;インストールしたパッケージにロードパスを通してロードする
    (package-initialize)
    )
  )
;; ----------------------------------------------------------------------
;; * [2012-05-31 木] ためしに memory-usage をインストールしてみた。イン
;; ストール直後は M-x memory-usage で使える。 Emacs 再起動後は使えない。
;; M-x package-list-packages で memory-usage を選択しても、ヘルプが表示
;; されない。 ~/.emacs.d/elpa/memory-usage-0.1 に配置されているようだ。
;; とりあえず、このディレクトリを手動で load すれば暫定運用可能か。
;; ----------------------------------------------------------------------
;; * [2012-06-04 月] 『実践入門』 p.120 コマンドから直接インストールする。
;; M-x list-packages によって一度パッケージリストを取得している場合、次のコマンドによってインストールできます。
;; M-x package-install RET multi-term RET
;; これは、次のS式を評価するのと同じです。
;; (package-install 'multi-term)
;; (package-install 'bm)
;; 先ほどと同じように M-x package-initialize すると、すぐに multi-term の機能を利用できるようになります。

