;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; #+LAST_UPDATED: 2014-09-15
;; my-pandoc-mode-map.el
;; 関連 my-pandoc-mode-package.el

;; ======================================================================
(bind-key "C-z / o" 'pandoc--set-output pandoc-mode-map)
(bind-key "C-z / h" 'my-pandoc-compile-markdown-to-html pandoc-mode-map)
(bind-key "C-z / b" 'my-pandoc-browse-markdown-to-html pandoc-mode-map)

;; ----------------------------------------------------------------------
;; cheat sheet
;; define-key デフォルト設定。
;; (define-key map "\C-c/c" 'pandoc-insert-@)
;; (define-key map "\C-c/C" 'pandoc-select-@)
;; (define-key map "\C-c/m" 'pandoc-set-metadata)
;; (define-key map "\C-c/p" 'pandoc-convert-to-pdf)
;; (define-key map "\C-c/r" 'pandoc-run-pandoc)
;; (define-key map "\C-c/s" 'pandoc-save-settings-file)
;; (define-key map "\C-c/S" 'pandoc-view-settings)
;; (define-key map "\C-c/v" 'pandoc-set-variable)
;; (define-key map "\C-c/V" 'pandoc-view-output)
;; (define-key map "\C-c/w" 'pandoc-set-write)

;; ----------------------------------------------------------------------
;; * [2014-09-26 金] TODO 現在開いているファイルを指定した形式に変換して開きなおすコマンド。
;; * [2014-09-26 金] TODO 現在開いているファイルを指定した形式に変換して保存コマンド。
;; * [2014-09-26 金] TODO save-buffer するときに、〈ファイルにローカルな変数〉にエクスポート形式が指定してあれば、保存後に指定した形式で出力する。
;; - cf. http://www.geocities.co.jp/SiliconValley-Bay/9285/EMACS-JA/emacs_444.html

;; ----------------------------------------------------------------------
;; * [2014-11-19 水] pandoc に PATH を通す。
(let* (
       (old-path (getenv "PATH"))
       (username (getenv "USERNAME"))
       (pandoc-location (format "C:/Users/%s/AppData/Local/Pandoc" username))
       (new-path (format "%s;%s" old-path pandoc-location))
       )
  (setenv "PATH" new-path)
  (message new-path)
  )
