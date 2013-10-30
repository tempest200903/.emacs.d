;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-08-25 木 13:00] モード定義
(defun my-cua-selection-mode (arg)
  (interactive "P")
  (cua-selection-mode arg)
  (if cua-mode
      (message "cua-selection-mode *ON*")
    (message "cua-selection-mode =off="))
  )
;; ----------------------------------------------------------------------
(easy-mmode-define-minor-mode cua-selection-indicator-mode
                              ;; ドキュメント
                              "This is cua-selection indicator mode."
                              ;; 初期値
                              nil
                              ;; モード行への表示
                              " CUA"
                              ;; マイナーモード用キーマップの初期値
                              '()
                              ;; rest
                              ()
                              ;; body
                              (progn
                                (if cua-selection-indicator-mode
                                    (progn (message "cua-selection-mode *ON*") (cua-selection-mode 1) )
                                  (progn (message "cua-selection-mode =off=")  (cua-selection-mode 0))
                                  )
                                )
                              )
(global-set-key (kbd "C-z C-\\") 'cua-selection-indicator-mode)
;; ----------------------------------------------------------------------
;; * [2011-09-20 火] cua-set-rectangle-mark {It is bound to <C-return>} が
;; org-mode の org-insert-heading-respect-content {It is bound to <C-return>}
;; と衝突している。
;; cua-global-keymap からこのキーバインドを取り除く。
;; (define-key cua-global-keymap (kbd "<C-return>") nil)
;; (define-key cua-global-keymap (kbd "C-c <C-return>") 'cua-set-rectangle-mark)
(require 'cua-base)
;; ----------------------------------------------------------------------
;; TODO cua-set-rectangle-mark {It is bound to <C-return>} の状態を mode-line に表示する。
