;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-anything-basis.el
;; ======================================================================
;; * [2011-12-15 木] anything-version "1.286"
;; N:\.emacs.d-d20110210\auto-install から抽出してきた。
;; 最新版の anything-version "1.3.6" は不具合あるので使わない。
;; ----------------------------------------------------------------------
(require 'anything-config)
;; goat-pc では error 発生。 make-directory: Creating directory: no such file or directory, c:/DOCUME~1/nakamura/LOCALS~1/Temp/Emacs/babel-8976A3b
;; emacs 起動完了後に eval すれば error 発生しない。なぜ？
;; dn2 では error 発生。emacs 起動完了後に eval しても error 発生。
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
