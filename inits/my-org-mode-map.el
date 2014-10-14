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

;; ~/.emacs.d/keymap/foreign-regexp-search-map.txt の foreign-regexp/align と衝突するので変更する。
;; (define-key global-map (kbd "M-s M-a") 'org-occur-in-agenda-files)
(define-key global-map (kbd "M-s a") 'org-occur-in-agenda-files)

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
(my-bind-key-with-autoload "my-org-mode-hyperlink" "C-c C-y" 'my-org-yank-link-univ org-mode-map)
(my-bind-key-with-autoload "my-org-mode-hyperlink" "C-c e" 'my-org-yank-elisp-moccur-link org-mode-map)

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
;; (define-key org-mode-map (kbd "C-c C-o") nil) ;; 他の用途に使うつもり。
(my-bind-key-with-autoload "my-kill-ring-save" "C-c C-o" 'my-copy-org-link-target-and-w32-shell-execute org-mode-map)
(define-key org-mode-map (kbd "C-z C-c C-y") 'my-insert-shell-bracket)
(define-key org-mode-map (kbd "C-z #") 'my-yank-org-example-arg)

(define-key org-mode-map (kbd "C-c 1") 'my-org-reset-schedule-today)
(define-key org-mode-map (kbd "C-c 2") 'my-org-reset-schedule-tomorrow)
(define-key org-mode-map (kbd "C-z 1") 'my-org-reset-deadline-today)
(define-key org-mode-map (kbd "C-z 2") 'my-org-reset-deadline-tomorrow)

;; ----------------------------------------------------------------------
;; * [2013-04-03 水] org-agenda-mode-map 初期化
(defun my-org-agenda-mode-map-init ()
  "org-agenda-mode-map 初期化"
  (define-key org-agenda-mode-map (kbd "d") 'org-agenda-deadline) ; alias of C-c C-d ; org-agenda-day-view を上書き。
  (define-key org-agenda-mode-map (kbd "s") 'org-agenda-schedule) ; alias of C-c C-s
  (define-key org-agenda-mode-map (kbd "S") 'org-save-all-org-buffers) ; "s" から "S" に移転。
  (define-key org-agenda-mode-map (kbd "_") 'org-agenda-day-view) ; "d" から "_" に移転。
  (define-key org-agenda-mode-map (kbd "|") 'org-agenda-columns) ; alias of C-c C-x C-c
  (define-key org-agenda-mode-map (kbd "C-c 1") 'my-org-agenda-reset-schedule-today)
  (define-key org-agenda-mode-map (kbd "C-c 2") 'my-org-agenda-reset-schedule-tomorrow)
  (define-key org-agenda-mode-map (kbd "C-z 1") 'my-org-agenda-reset-deadline-today)
  (define-key org-agenda-mode-map (kbd "C-z 2") 'my-org-agenda-reset-deadline-tomorrow)
  ;; ** [2014-10-08 水] TODO key map 見直し。
  ;; d d => 通常の org-agenda-deadline
  ;; d 0 => deadline +0d
  ;; d 1 => deadline +1d
  ;; d w => deadline +1w
  ;; d m => deadline +1m
  ;; s s => 通常の org-agenda-schedule
  ;; s 0 => schedule +0d
  ;; s 1 => schedule +1d
  ;; s w => schedule +1w
  ;; s m => deadline +1m


  (bind-key "C-," 'org-open-at-point org-mode-map) ; alias of C-c C-o

  (my-bind-key-with-autoload "my-org-countdown" "C-c ." 'my-org-countdown-start org-agenda-mode-map)

  )
(defun my-timemanager-init ()
  "my-timemanager 初期化"

  ;; default org-agenda-sunrise-sunset を上書きする。
  (my-bind-key-with-autoload "my-timemanager" "N" 'my-timemanager-write-file org-agenda-mode-map)

  ;; default org-agenda-convert-date を上書きする。
  (my-bind-key-with-autoload "my-timemanager" "C" 'my-timemanager-collect org-agenda-mode-map)

  ;; default org-agenda-phases-of-moon を上書きする
  (my-bind-key-with-autoload "my-timemanager" "M" 'my-timemanager-show-closed-project org-agenda-mode-map)
  )
(add-hook 'org-agenda-mode-hook 'my-org-agenda-mode-map-init)
(add-hook 'org-agenda-mode-hook 'my-timemanager-init)
;;
;; hook しないでいきなり define-key すると、起動時にエラー発生。
;; エラーメッセージは ` Symbol's value as variable is void: org-agenda-mode-map `.
;; これは起動時には org-agenda-mode-map がまだ存在しないため。
;; ----------------------------------------------------------------------
;; * [2014-09-18 木] my-pandoc-mode-package.el
(my-bind-key-with-autoload "my-pandoc-mode-package" "C-z C-e t" 'my-pandoc-compile-org-to-textile org-mode-map)

;; ----------------------------------------------------------------------
;; * [2014-09-30 火] my-kill-ring-save.el
;; (bind-key "C-c M-w" 'my-kill-ring-save-or-copy-org-link-target org-mode-map)
(my-bind-key-with-autoload "my-kill-ring-save" "C-c M-w" 'my-kill-ring-save-or-copy-org-link-target org-mode-map)

;; ----------------------------------------------------------------------
;; * [2014-10-09 木] alias
(defalias 'oti 'org-table-import)
(defalias 'ote 'org-table-export)

(define-key org-mode-map (kbd "C-c t i") 'org-table-import)
(define-key org-mode-map (kbd "C-c t e") 'org-table-export)
