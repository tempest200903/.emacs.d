;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2012-02-24
;; ======================================================================
;; * [2012-02-16 木] wrap-region.el
;; url: http://d.hatena.ne.jp/syohex/20120207
;; リージョンを特定の文字列で囲う wrap-region.elの紹介
;; auto-install.elを設定済みの人は以下の S式を実行してください
;; (auto-install-from-url "https://raw.github.com/rejeep/wrap-region/master/wrap-region.el")
;; ~/.emacs.d/auto-install/wrap-region.el
;;
;; 設定
;;   (require 'wrap-region)
;;   ;; グローバルに有効。個別の場合は (wrap-region-mode t)
;;   (wrap-region-global-mode t)
;;   ;; paredit.elで同様の機能があるため、念の為
;;   (add-to-list 'wrap-region-except-modes 'emacs-lisp-mode)
;;   (add-to-list 'wrap-region-except-modes 'scheme-mode)
;;   (add-to-list 'wrap-region-except-modes 'lisp-mode)
;;   (add-to-list 'wrap-region-except-modes 'clojure-mode)
;; 機能の追加
;; デフォルトではリージョンを選択して ダブルクォート, シングルクォート,
;; 左丸括弧, 左波括弧、左角括弧を入力すると対応するものでリージョンを囲って
;; くれます。独自にそれらを定義することもできます。詳しくは githubの
;; ドキュメントを見てください。
;; ;; 第一引数:リージョンの先頭に挿入する文字
;;   ;; 第二引数:リージョン末尾に挿入する文字
;;   (wrap-region-add-wrapper "$" "$")
;;   ;; 第三引数:トリガとなるキー
;;   ;; 第四引数:有効にするモード
;;   (wrap-region-add-wrapper "/*" "*/" "#" '(css-mode java-mode))
;;   (wrap-region-add-wrapper "=over 4" "=back" "L" '(pod-mode))

(require 'wrap-region)
(wrap-region-global-mode t)
(wrap-region-add-wrapper "/" "/" nil 'ruby-mode)
(wrap-region-add-wrapper "/* " " */" "#" '(java-mode javascript-mode css-mode))
(wrap-region-add-wrapper "`" "`" nil '(ruby-mode))
(wrap-region-add-wrapper "<!-- " " -->" "!" '(nxml-mode))
