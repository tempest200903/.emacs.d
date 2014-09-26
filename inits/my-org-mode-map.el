;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; my-org-mode-map.el
;; #+LAST_UPDATED: 2014-09-05
;; ----------------------------------------------------------------------
;; my-org-mode-map.el にごみが多い＆ anything を require しない方針にしたので、
;; いったん全ての式を my-org-mode-map-deprecated.el に移動した。
;; 必要な式だけを my-org-mode-map.el に戻す。
;; ----------------------------------------------------------------------
;; [2014-09-06 土] * require
(require 'org)
(org-version) ;; "Org-mode version 7.8.11"
;; ----------------------------------------------------------------------
;; [2014-09-06 土] * global
;; 『Emacs org-modeを使ってみる: (1) インストール - 屯遁のパズルとプログラミングの日記』
;; http://d.hatena.ne.jp/tamura70/20100203/org
;;
(define-key global-map (kbd "C-c l")   'org-store-link)
(define-key global-map (kbd "C-:")     'org-agenda)
(my-bind-key-with-autoload "my-org-mode-buffer" "C-M-:" 'my-org-agenda-list-switch-to-buffer-sequential)
(define-key global-map (kbd "C-M-]")   'my-org-edit-agenda-file-list-switch-to-buffer)
(define-key global-map (kbd "M-g M-j") 'org-clock-goto)
(define-key global-map (kbd "M-g M-u") 'my-org-clock-goto-u)
(define-key global-map (kbd "M-g M-h") 'my-org-clock-goto-default)
(define-key global-map (kbd "M-s M-a") 'org-occur-in-agenda-files)
(define-key global-map (kbd "C-z C-u") 'org-time-stamp-inactive)
;;
;; cf. http://orgmode.org/manual/Activation.html#Activation 
;; org-iswitchb はほとんど使わない。 howm でファイル名が日付始まりなので。
(define-key global-map (kbd "C-c b")   'org-iswitchb) 
;; ----------------------------------------------------------------------
;; * [2013-04-03 水] org-mode-map 初期化
;; ** outline 関連
(define-key org-mode-map (kbd "M-[") 'outline-previous-visible-heading)
(define-key org-mode-map (kbd "M-]") 'outline-next-visible-heading)
;; ** link 関連
(define-key org-mode-map (kbd "C-c C-x l") 'my-org-convert-to-link) "前提: my-org-mode-hyperlink.el"
(define-key org-mode-map (kbd "M-g M-p") 'org-previous-link)
(define-key org-mode-map (kbd "M-g M-n") 'org-next-link)
;; ** checkbox 関連
(define-key org-mode-map (kbd "C-z C-]") (kbd "C-u C-c C-c M-m C-a C-@ C-@")) ;; alias of C-u C-c C-c
(define-key org-mode-map (kbd "C-c C-x r") 'org-reset-checkbox-state-subtree)
;; tips C-u M-x org-mouse-insert-checkbox で checkbox を消去できる。
;; ** yank 関連
(define-key org-mode-map (kbd "C-c C-y") 'my-org-yank-link-arg) 
(define-key org-mode-map (kbd "C-c y") 'org-evaluate-time-range)
(define-key org-mode-map (kbd "C-c c") 'my-insert-clocktable)
;; org-evaluate-time-range をデフォルトの C-c C-y から C-c y に移動した。
;; ----------------------------------------------------------------------
;; * [2014-01-09 木] org-open-at-point, org-mark-ring-goto をよく使うので、 C-, , C-. に割り当てる。
;; (kbd "C-,") のデフォルトは (org-cycle-agenda-files) It is bound to C-', C-,
;; (kbd "C-c C-o") のデフォルトは (org-open-at-point) It is bound to C-c C-o
;; * [2014-05-08 木] my-org-mode-hyperlink.el
(define-key org-mode-map (kbd "C-.") 'org-mark-ring-goto)
(define-key org-mode-map (kbd "C-,") 'org-open-at-point)
(define-key org-mode-map (kbd "C-c C-o") nil) ;; 他の用途に使うつもり。
(define-key org-mode-map (kbd "C-z C-c C-y") 'my-insert-shell-bracket)
(define-key org-mode-map (kbd "C-z #") 'my-yank-org-example-arg)
;; ----------------------------------------------------------------------
;; * [2013-04-03 水] org-agenda-mode-map 初期化
(defun my-org-agenda-mode-map-init ()
  "org-agenda-mode-map 初期化"
  (define-key org-agenda-mode-map (kbd "`") 'org-agenda-deadline) ;; alias of C-c C-d
  (define-key org-agenda-mode-map (kbd "@") 'org-agenda-schedule) ;; alias of C-c C-s
  (define-key org-agenda-mode-map (kbd "|") 'org-agenda-columns) ;; alias of C-c C-x C-c
  (define-key org-agenda-mode-map (kbd "C-z 1") 'my-org-reset-schedule-today)
  (define-key org-agenda-mode-map (kbd "C-z 2") 'my-org-reset-schedule-tomorrow)
  (bind-key "C-," 'org-open-at-point org-mode-map) ;; alias of C-c C-o
  )
(defun my-workmanager-init ()
  "my-workmanager 初期化"
  ;; default org-agenda-sunrise-sunset を上書きする。
  (define-key org-agenda-mode-map (kbd "S") 'my-workmanager-write-file) 
  ;; default org-agenda-convert-date を上書きする。
  (define-key org-agenda-mode-map (kbd "C") 'my-workmanager-collect) 
  )
(add-hook 'org-agenda-mode-hook 'my-org-agenda-mode-map-init)
(add-hook 'org-agenda-mode-hook 'my-workmanager-init)
;; 
;; hook しないでいきなり define-key すると、起動時にエラー発生。
;; エラーメッセージは ` Symbol's value as variable is void: org-agenda-mode-map `.
;; これは起動時には org-agenda-mode-map がまだ存在しないため。
;; ----------------------------------------------------------------------
;; * [2014-09-05 金] alias
;; org-clone-subtree-with-time-shift して、今日の日付をセットする。
;; (define-key org-mode-map (kbd "C-c M-.") 'my-org-clone-subtree-with-time-shift-today)
;; ** TODO [2014-09-16 火] org-reset-checkbox-state-subtree も入れる。
;; ** TODO [2014-09-16 火] (define-key org-mode-map (kbd "C-c M-.") (kbd "C- ...")) 形式にしたほうが読みやすいし変更しやすい。
;; ** TODO [2014-09-19 金] my-org-clone-subtree-with-time-shift-1day バグがある。 SCHEDULE より DEADLINE が先にあると、 DEADLINE を読み取ってしまう。
;; ** TODO [2014-09-25 木] DRY
;; ** TODO [2014-09-25 木] undo 1回で最初の状態に戻したい。
;; ** TODO [2014-09-25 木] C-u 数字で日数を指定したい。
;; org-clone-subtree-with-time-shift して、1日インクリメントするキーボードマクロ。
(define-key org-mode-map
  (kbd "C-c M-1")
  (kbd "C-c C-x c 1 RET +1d RET C-c C-n C-M-s SCHEDULED RET M-f M-w M-[ C-M-s -d RET C-y C-u 3 M-d")
  )
;; org-clone-subtree-with-time-shift して、5日インクリメントするキーボードマクロ。
(define-key org-mode-map
  (kbd "C-c M-5")
  (kbd "C-c C-x c 1 RET +5d RET C-c C-n C-M-s SCHEDULED RET M-f M-w M-[ C-M-s -d RET C-y C-u 3 M-d")
  )
;; org-clone-subtree-with-time-shift して、6日インクリメントするキーボードマクロ。
(define-key org-mode-map
  (kbd "C-c M-6")
  (kbd "C-c C-x c 1 RET +6d RET C-c C-n C-M-s SCHEDULED RET M-f M-w M-[ C-M-s -d RET C-y C-u 3 M-d")
  )
;; org-clone-subtree-with-time-shift して、7日インクリメントするキーボードマクロ。
(define-key org-mode-map
  (kbd "C-c M-7")
  (kbd "C-c C-x c 1 RET +7d RET C-c C-n C-M-s SCHEDULED RET M-f M-w M-[ C-M-s -d RET C-y C-u 3 M-d")
  )
;;
(defun my-org-clone-subtree-with-time-shift (shift)
  ""
  (interactive)
  (progn
    (outline-up-heading 1)
    (org-clone-subtree-with-time-shift 1 shift)
    (org-forward-same-level 1)
    (org-reset-checkbox-state-subtree)
    (org-agenda-set-restriction-lock)
    (org-todo-list "DONE")
    (org-agenda-bulk-mark-regexp "DONE")
    (org-agenda-bulk-action nil)
    )
  ) 
;; ----------------------------------------------------------------------
;; * [2014-09-18 木] my-pandoc-mode-package
(my-bind-key-with-autoload "my-pandoc-mode-package" "C-z C-e t" 'my-pandoc-compile-org-to-textile org-mode-map)
