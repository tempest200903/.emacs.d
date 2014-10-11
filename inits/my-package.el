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
;; * [2014-10-11 土]
;; http://d.hatena.ne.jp/syohex/20141011/1412996912
;; marmaladeは最近はあまり使われていないので, melpa-stableにした方がよいです. 
;; marmaladeにしかないパッケージがあれば別ですが, 安定版を使うという用途であれば
;; melpa-stableの方がよいです.

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
    (add-to-list 'package-archives '("ELPA" . "http://tromey.com/elpa/"))
    (add-to-list 'package-archives '("MELPA" . "http://melpa.milkbox.net/packages/"))
    ;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
    ;;インストールするディレクトリを指定
    (setq package-user-dir (concat user-emacs-directory "vendor/elpa"))
    ;;インストールしたパッケージにロードパスを通してロードする
    (package-initialize)

    (add-hook 'package-menu-mode-hook (lambda() (hl-line-mode 1)))
    )
  )

;; * [2014-09-13 土] https://twitter.com/edd_ess/status/508511577021374464
;; #emacs is marmalade down?
;; http://marmalade-repo.org/packages/ が応答なし。
;; ----------------------------------------------------------------------
;; * [2014-09-09 火]
;; http://qiita.com/k_ui/items/3e6fb470e6f80bae046e
;; Emacs - インストール済みパッケージの再現 - Qiita
;; これで、init.el 次回起動時に勝手にインストールして require してくれる。
;; 仮にパッケージ消えててインストールがコケても、`when' 
;; のボディー部分が走らないだけになる。

(defun package-require (feature &optional filename packagename noerror)
  "《require》 の代わりに使う関数。PACKAGENAME(or FEATURE) が未イ
  ンストール時は、《require》 する前に《package-install》 によるパッ
  ケージインストールを試みる。NOERROR が non-nil ならば、
  PACKAGENAME(or FEATURE) が存在しなかったり、《require》 が失敗した
  時に 《error》 ではなく、nil を返す。（《require》 の第三引数相当
  の挙動）"
  (unless package--initialized (package-initialize))
  (unless package-archive-contents (package-refresh-contents))
  (let ((pname (or packagename feature)))
    (if (assq pname package-archive-contents)
        (let nil
          (unless (package-installed-p pname)
            (unless package-archive-contents (package-refresh-contents))
            ;; TODO パッケージ配信鯖が死んでるときの対処
            (package-install pname))
          (or (require feature filename t)
              (if noerror nil
                (error "Package `%s' does not provide the feature `%s'"
                       (symbol-name pname) (symbol-name feature)))))
      (if noerror nil
        (error "Package `%s' is not available for installation"
               (symbol-name feature))))))

;; * [2014-09-27 土] TODO package-require 引数 filename packagename を
;; 省略したまま、 noerror t にして使いた
;; い。
;; ----------------------------------------------------------------------
;; * [2012-05-31 木] ためしに memory-usage をインストールしてみた。イン
;; ストール直後は M-x memory-usage で使える。 Emacs 再起動後は使えない。
;; M-x package-list-packages で memory-usage を選択しても、ヘルプが表示
;; されない。 ~/.emacs.d/elpa/memory-usage-0.1 に配置されているようだ。
;; とりあえず、このディレクトリを手動で load すれば暫定運用可能
;; か。
;; ----------------------------------------------------------------------
;; * [2012-06-04 月] 『実践入門』 p.120 コマンドから直接インストールす
;; る。M-x list-packages によって一度パッケージリストを取得している場合、
;; 次のコマンドによってインストールできます。M-x package-install RET
;; multi-term RETこれは、次のS式を評価するのと同じです。
;; (package-install 'multi-term) (package-install 'bm)先ほどと同じよう
;; に M-x package-initialize すると、すぐに multi-term の機能を利用でき
;; るようになりま
;; す。
;; ----------------------------------------------------------------------
;; TODO http://qiita.com/catatsuy/items/5f1cd86e2522fd3384a0
;; init-loader.el と package.el を導入して快適 Emacs ライフ - Qiita
;; ----------------------------------------------------------------------
(defalias 'plp 'package-list-packages)
;; ----------------------------------------------------------------------
(provide 'my-package)
;; ----------------------------------------------------------------------
