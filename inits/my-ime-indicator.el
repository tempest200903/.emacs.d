;; -*- coding: utf-8-unix; mode: Emacs-Lisp -*-
;; ======================================================================
;; * [2011-09-05 月] 自作マイナーモード。IME on/off を mode-line に表示したい。
;; - 「IME on/off を mode-line に表示する」だけのモードを用意しておいて、
;;   <non-convert>, <M-kanji> にこのモードを割り当てておけば可能か？
;; - http://tech.feedforce.jp/emacs-minor-mode.html
;;   - Easy-Mmodeを使ってEmacsのマイナーモードを作る
;; #+BEGIN_EXAMPLE
;; (easy-mmode-define-minor-mode rsssuite-mode
;; ;; ドキュメント
;;  "This is RSS Suite Mode."
;;  ;; 初期値
;;  nil;; モード行への表示
;;  "RSSSuite"
;;  ;; マイナーモード用キーマップの初期値
;;  '(("C-cf" . suite-open-formprocess)
;;    ("C-cp" . suite-open-pagecontents)
;;    ("C-cq" . suite-open-qfd)
;;    ("C-ct" . suite-open-template)))
;; #+END_EXAMPLE
;; ついでに、 mode on のときは、 hl-line-mode および mode-line の face を変更する。
;;
(easy-mmode-define-minor-mode ime-indicator-mode
                              ;; ドキュメント
                              "This is ime indicator mode."
                              ;; 初期値
                              nil
                              ;; モード行への表示
                              " IME"
                              ;; マイナーモード用キーマップの初期値
                              '()
                              ;; rest
                              ()
                              ;; body
                              (progn
                                (if ime-indicator-mode
                                    (progn (set-cursor-color "DarkOrange") (message "IME *ON*"))
                                  (progn (set-cursor-color "DarkSlateGray") (message "IME =off="))
                                  )
                                )
                              )
;;
(defun ime-indicator-mode-on ()
  "mode on"
  (interactive)
  ;; IME on のときに <non-convert> を押すと、1回目は <M-kanji> 扱いになってしまう。理由は不明。
  (if ime-indicator-mode
      (ime-indicator-mode 0)
    (ime-indicator-mode 1)
    )
  )
;;
(defun ime-indicator-mode-off ()
  "mode on"
  (interactive)
  (ime-indicator-mode 0)
  )
;;
(define-key global-map (kbd "<M-kanji>") 'ime-indicator-mode-on)
(define-key global-map (kbd "<non-convert>") 'ime-indicator-mode-off)
