;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-12-15 木] anything-version "1.286"
;; N:\.emacs.d-d20110210\auto-install から抽出してきた。
;; 最新版の anything-version "1.3.6" は不具合あるので使わない。
;; ----------------------------------------------------------------------
(setq anything-command-map-prefix-key "C-t")
;; ----------------------------------------------------------------------
(require 'anything-config)
;; gota-pc では error 発生。 make-directory: Creating directory: no such file or directory, c:/DOCUME~1/nakamura/LOCALS~1/Temp/Emacs/babel-8976A3b
;; emacs 起動完了後に eval すれば error 発生しない。なぜ？
;; ----------------------------------------------------------------------
;; * [2010-11-27 土] キーマップ my-anything-map
(define-prefix-command 'my-anything-map)
(global-set-key (kbd "C-t") 'my-anything-map)
(define-key my-anything-map (kbd "SPC") 'anything-execute-anything-command)
(define-key my-anything-map (kbd "C-t") 'anything-at-point)
                                        ; when C-u is pressed, the initial input is the symbol at point.
(define-key my-anything-map (kbd "C-q") 'anything-resume)
                                        ; 直前に利用した Anything コマンドの結果を再現してくれます。
(define-key my-anything-map (kbd "C-l") 'anything-bookmarks)
(define-key my-anything-map (kbd "C-k") 'anything-for-files)
(define-key my-anything-map (kbd "C-x C-f") 'anything-find-files)
(define-key my-anything-map (kbd "b") 'anything-buffers-list)
(define-key my-anything-map (kbd "C-v") 'anything-recentf)
(define-key my-anything-map (kbd "C-i") 'anything-imenu) 
(define-key my-anything-map (kbd "C-o") 'anything-occur)
(define-key my-anything-map (kbd "C-y") 'anything-show-kill-ring)
(define-key my-anything-map (kbd "C-p") 'anything-minibuffer-history)
(define-key my-anything-map (kbd "r") 'anything-register)
(define-key my-anything-map (kbd "C-r") 'anything-regexp)
(define-key my-anything-map (kbd "C-a") 'anything-c-apropos)
(define-key my-anything-map (kbd "M-x") 'anything-M-x)
(define-key my-anything-map (kbd "C-e") 'anything-calcul-expression)
(define-key my-anything-map (kbd "C-@") 'anything-all-mark-rings)
(define-key my-anything-map (kbd "C-SPC") 'anything-all-mark-rings)
(define-key my-anything-map (kbd "C-d") 'anything-do-grep)

;; 実験中
(define-key my-anything-map (kbd "C-s") 'anything-minibuffer-history)
(define-key my-anything-map (kbd "C-w") 'anything-info-at-point) ;; lisp ドキュメント, info, Google suggest で検索する。 C-w でカーソル位置の単語を取り込み。
(define-key my-anything-map (kbd "s") 'anything-c-etags-select)
(define-key my-anything-map (kbd "g") 'anything-google-suggest)

;; anything 以外
(define-key my-anything-map (kbd "C-f") 'next-multiframe-window)
(define-key my-anything-map (kbd "C-b") 'previous-multiframe-window)
(define-key my-anything-map (kbd "C-n") 'raise-other-frame)
(define-key my-anything-map (kbd "C-p") 'raise-other-frame-minus)
(define-key my-anything-map (kbd "4") 'delete-frame)
(define-key my-anything-map (kbd "5") 'make-frame-command)
;; ----------------------------------------------------------------------
;; * [2012-05-20 日] キーマップ isearch-mode-map
;; * [2012-05-20 日] cf. n:/download/Emacs/sample_emacs_d/github.com.shishi/shishi-.emacs.d-9d470cf/inits/05-util.el
;; isearch から anything-occur に移行する。
(define-key isearch-mode-map (kbd "C-t") 'anything-c-moccur-from-isearch)
;; ----------------------------------------------------------------------
;; * [2012-05-20 日] キーマップ dired-mode
;; * [2012-05-20 日] cf. n:/download/Emacs/sample_emacs_d/github.com.shishi/shishi-.emacs.d-9d470cf/inits/05-util.el
;; dired で複数ファイルをマークしてから実行すると、マークしたファイル全てを対象に occur する。便利だ。
(defun dired-mode-hook-for-anything-c-moccur ()
  (local-set-key (kbd "C-M-o") 'anything-c-moccur-dired-do-moccur-by-moccur))
(add-hook 'dired-mode-hook 'dired-mode-hook-for-anything-c-moccur)
;; ----------------------------------------------------------------------
;; * [2011-12-15 木] ソース
;; anything-sources
;; Default value is (anything-c-source-buffers+ anything-c-source-recentf anything-c-source-files-in-current-dir+)
(setq anything-sources
      '(
        ;; anything-c-source-global-mark-ring
        ;; anything-c-source-buffers+ ;; バッファ選択機能を提供します。
        anything-c-source-bookmarks
        ;; anything-c-source-recentf  ;; recentf を使って file-file する機能を提供します。
        ;; anything-c-source-files-in-current-dir+
        ;; anything-c-source-kill-ring
        anything-c-source-occur ;; カレントバッファを occur する。常に末尾に表示される。
        ))
                                        ; [2012-02-02 木 11:20] 多すぎるので絞る。
;; ----------------------------------------------------------------------
;; * [2011-12-17 土] descbinds-anything.el を導入する。
(when (require 'descbinds-anything nil t)
  (descbinds-anything-install)
  )

;; (descbinds-anything-install) を eval すると下記の error が発生する。
;; Debugger entered--Lisp error: (void-function descbinds-anything-install)
;;   (descbinds-anything-install)
;;   eval((descbinds-anything-install))
;;   eval-last-sexp-1(nil)
;;   eval-last-sexp(nil)
;;   call-interactively(eval-last-sexp nil nil)

;; ----------------------------------------------------------------------
;; * [2012-05-22 火] n:/download/Emacs/sample_emacs_d/github.com.shishi/shishi-.emacs.d-9d470cf/inits/10-anything.el
;; 候補が多いときに体感速度を早くする
(setq anything-quick-update t)
