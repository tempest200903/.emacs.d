;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; my-toggle-truncate-lines.el
;; ======================================================================
;; * [2011-02-28]
;; url:http://ubulog.blogspot.com/2007/09/emacsonoff.html
;; 折り返し表示ON/OFF
;; (defun my-toggle-truncate-lines ()
;;   "折り返し表示をトグル動作します."
;;   (interactive)
;;   (if truncate-lines
;;       (setq truncate-lines nil)
;;     (setq truncate-lines t)
;;     )
;;   (recenter)
;;   )
;; ----------------------------------------------------------------------
;; * [2014-09-22 月] 自作マイナーモード。
(defun my-truncate-lines-mode-on () ""
  (message "truncate-lines *ON*")

  (setq truncate-lines t)
  (recenter)
  )
(defun my-truncate-lines-mode-off () ""
  (message "truncate-lines =off=")
  (setq truncate-lines nil)
  (recenter)
  )
(easy-mmode-define-minor-mode my-truncate-lines-mode
                              ;; ドキュメント
                              "This is truncate-lines mode."
                              ;; 初期値
                              nil
                              ;; モード行への表示
                              " Trunc"
                              ;; マイナーモード用キーマップの初期値
                              '()
                              ;; rest
                              ()
                              ;; body
                              (if my-truncate-lines-mode
                                  (my-truncate-lines-mode-off)
                                (my-truncate-lines-mode-on)
                                )
                              )
;; cf. http://tech.feedforce.jp/emacs-minor-mode.html
;; Easy-Mmodeを使ってEmacsのマイナーモードを作る
;; ----------------------------------------------------------------------
(provide 'my-toggle-truncate-lines)
;; ----------------------------------------------------------------------
;; * [2014-02-21 金] TODO mode-line に truncate-lines を表示する。
(my-truncate-lines-mode-off)
