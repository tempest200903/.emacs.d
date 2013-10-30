;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-01-27 木 16:19] bf-mode 導入
;; url: http://www.bookshelf.jp/elc/bf-mode.el
;; url: http://www.bookshelf.jp/soft/meadow_25.html#SEC300
;; url: http://www.bookshelf.jp/pukiwiki/pukiwiki.php?MeadowMemo%2Fdired%A4%C7%A5%D5%A5%A1%A5%A4%A5%EB%A4%CE%C6%E2%CD%C6%A4%F2%C9%BD%BC%A8%A1%BDbf-mode
;; 
;; 以下を.emacs に追加します．
;; (require 'bf-mode)
;; 以下は必要に応じて設定します．
;; ;; 別ウィンドウに表示するサイズの上限
;; (setq bf-mode-browsing-size 10)
;; ;; 別ウィンドウに表示しないファイルの拡張子
;; (setq bf-mode-except-ext '("\\.exe$" "\\.com$"))
;; ;; 容量がいくつであっても表示して欲しいもの
;; (setq bf-mode-force-browse-exts
;;       (append '("\\.texi$" "\\.el$")
;;               bf-mode-force-browse-exts))
;; ;; html は w3m で表示する
;; (setq bf-mode-html-with-w3m t)
;; ;; 圧縮されたファイルを表示
;; (setq bf-mode-archive-list-verbose t)
;; ;; ディレクトリ内のファイル一覧を表示
;; (setq bf-mode-directory-list-verbose t)
;;
(require 'bf-mode)
;; dired のキー割り当て追加

;; (kdb "b") は diredp-byte-compile-this-file と衝突するが、
;; (kdb "B") は dired-do-byte-compile の方が機能豊富そうなので支障ないはず。
(defun my-dired-mode-map-init ()
  (define-key dired-mode-map (kbd "b") 'bf-mode) 
  )

(add-hook 'dired-mode-hook 'my-dired-mode-map-init)
;; 圧縮されたファイルを表示
(setq bf-mode-archive-list-verbose t)
;; ディレクトリ内のファイル一覧を表示
(setq bf-mode-directory-list-verbose t)
