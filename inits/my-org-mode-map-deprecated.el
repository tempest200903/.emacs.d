;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; my-org-mode-map-deprecated.el
;; #+LAST_UPDATED: 2014-09-05
;; ----------------------------------------------------------------------
;; my-org-mode-map.el にごみが多い＆ anything を require しない方針にしたので、
;; いったん全ての式を my-org-mode-map-deprecated.el に移動した。
;; 必要な式だけを my-org-mode-map.el に戻す。
;; ----------------------------------------------------------------------
;; http://hpcgi1.nifty.com/spen/index.cgi?OrgMode%2fManual1#i2
;; * [2010-11-01 月] 汎用的に使うので global-map
(defun my-org-clock-goto-u ()
  "alias of C-u M-x org-clock-goto"
  (interactive)
  (call-interactively 'set-mark-command)
  (org-clock-goto t)
  (call-interactively 'set-mark-command)
  )
;; "alias of C-u M-x my-org-clock-goto-u d C-l C-l
(fset 'my-org-clock-goto-default
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ("\347\365d" 0 "%d")) arg)))
;; ----------------------------------------------------------------------
;; * org-mode-map
(define-key org-mode-map (kbd "C-c C-x d") 'org-clock-mark-default-task)
;; ----------------------------------------------------------------------
;; * [2011-04-23 土] よく使う keybind を短縮したい。
(defun my-org-mouse-context-menu() "org-mouse-context-menu interactive"
  (interactive)
  (org-mouse-context-menu)
  )
(define-key org-mode-map (kbd "C-c <apps>") 'my-org-mouse-context-menu)
;; ----------------------------------------------------------------------
;; * [2013-04-03 水]
;;   "* checkbox 関連"
;;   "org-mouse は emacs 本体付属。 require 必要。"
(when (require 'org-mouse nil t)
  (define-key org-mode-map (kbd "C-z C-]") 'org-mouse-insert-checkbox) ;; alias of C-u C-c C-c
  )
;; tips C-u M-x org-mouse-insert-checkbox で checkbox を消去できる。
(define-key org-mode-map (kbd "C-c C-x r") 'org-reset-checkbox-state-subtree)
;;   "* link 関連"
;;   (define-key org-mode-map (kbd "C-c C-x l") 'my-org-convert-to-link) "前提: my-org-mode-hyperlink.el"
(define-key org-mode-map (kbd "M-g M-p") 'org-previous-link)
(define-key org-mode-map (kbd "M-g M-n") 'org-next-link)

;;   ;; * カレントバッファから hyperlink を occur するキーボード変換。 C-c C-SPC で元の位置に戻れる。
(define-key org-mode-map (kbd "M-s [") (kbd "C-z C-SPC C-x 1 M-s o \\[ \\[ RET C-x o C-c C-f"))

;;   "* yank 関連"
(define-key org-mode-map (kbd "C-c C-y") 'my-org-yank-link-arg) "org-evaluate-time-range をデフォルトの C-c C-y から C-c y に移動した。"
;; (define-key org-mode-map (kbd "C-z C-c C-y") 'my-org-yank-file-link) ;; (kbd "C-u C-c C-y") で my-org-yank-file-link 起動するようにしたので、不要。

;; "* clock 関連"
(define-key org-mode-map (kbd "C-c C-x d") 'org-clock-mark-default-task)

;; "* org anything 関連"
(when (require 'anything nil t)
  (define-key org-mode-map (kbd "C-t C-c C-y") 'anything-org-keywords)
                                        ; It is bound to <menu-bar> <Anything> <Org:> <Org keywords>.
  (define-key org-mode-map (kbd "C-t C-j") 'anything-org-headlines)
                                        ; It is bound to <menu-bar> <Anything> <Org:> <Org headlines>.
  )

;; "* time 関連"
(define-key org-mode-map (kbd "C-c y") 'org-evaluate-time-range)

;;   "* mark-ring 関連"
(define-key org-mode-map (kbd "C-c C-SPC") 'org-mark-ring-goto)
;;   ;; C-c & は押しにくいので alias. (pop-global-mark) {It is bound to C-x C-@} に似せる。
;;   ;; C-c C-o で行って C-c C-SPC で帰る。 "
(define-key org-mode-map (kbd "C-z C-SPC") 'org-mark-ring-push)
;;   ;; C-c % は押しにくいので alias. (set-mark-command ARG) {It is bound to C-@}
;;   ;; ほとんどの場合、 set-mark-command で十分。何が違う？
"* その他"
;; (define-key org-mode-map (kbd "C-c C-x C-e") 'org-table-export)
;; (define-key org-mode-map (kbd "C-z C-c C-:") (kbd "C-: a 7 b C-u l R w")) ;; for orgweek
;;   "前提: my-org-clock-display.el"
(define-key org-mode-map (kbd "M-s M-v") 'org-toggle-inline-images) ;; alias of C-x C-c C-v
(define-key org-mode-map (kbd "C-*") 'org-ctrl-c-star) ;; alias of C-c *
(define-key org-mode-map (kbd "C-z C-a") 'org-toggle-checkbox) ;; alias of C-c C-x C-b
(define-key org-mode-map (kbd "C-c C-x |") 'org-table-convert-region)
;; ----------------------------------------------------------------------
;; * [2013-04-03 水] org-agenda-mode-map 初期化
(defun my-org-agenda-mode-map-init ()
  "org-agenda-mode-map 初期化"
  (define-key org-agenda-mode-map (kbd "`") 'org-agenda-deadline) ;; alias of C-c C-d
  (define-key org-agenda-mode-map (kbd "@") 'org-agenda-schedule) ;; alias of C-c C-s
  (define-key org-agenda-mode-map (kbd "|") 'org-agenda-columns) ;; alias of C-c C-x C-c
  (define-key org-agenda-mode-map (kbd "C-z 1") 'my-org-reset-schedule-today)
  (define-key org-agenda-mode-map (kbd "C-z 2") 'my-org-reset-schedule-tomorrow)
  )
(add-hook 'org-agenda-mode-hook 'my-org-agenda-mode-map-init)
;; hook しないでいきなり define-key すると、起動時にエラー発生。
;; エラーメッセージは ` Symbol's value as variable is void: org-agenda-mode-map `.
;; これは起動時には org-agenda-mode-map がまだ存在しないため。
;; ----------------------------------------------------------------------
;; * [2013-11-01 金] 空いているキーバインド
;; (kbd "C-c z")
;; (kbd "C-x C-:") は空いている。
;; ----------------------------------------------------------------------
;; * [2014-01-09 木] org-open-at-point, org-mark-ring-goto をよく使うので、 C-, , C-. に割り当てる。
;; (kbd "C-,") のデフォルトは (org-cycle-agenda-files) It is bound to C-', C-,
;; (kbd "C-c C-o") のデフォルトは (org-open-at-point) It is bound to C-c C-o
;; * [2014-05-08 木] my-org-mode-hyperlink.el
(define-key org-mode-map (kbd "C-.") 'org-mark-ring-goto)
(define-key org-mode-map (kbd "C-,") 'org-open-at-point)
(define-key org-mode-map (kbd "C-c C-o") nil)
(global-set-key (kbd "C-z C-c C-y") 'my-insert-shell-bracket)
(global-set-key (kbd "C-z #") 'my-yank-org-example-arg)
;; ----------------------------------------------------------------------
;; * [2014-04-11 金] my-yank-special.el
(define-key org-mode-map (kbd "C-z M-s M-o") 'my-yank-with-link-occur)
(define-key org-mode-map (kbd "C-z C-o") nil)
(define-key org-mode-map (kbd "C-z M-s M-a") 'my-yank-with-link-org-occur)
;; ----------------------------------------------------------------------
;; * [2014-08-06 水] my-org-reset-schedule-today at my-org-speed.el
(define-key org-mode-map (kbd "C-z 1") 'my-org-reset-schedule-today)
(define-key org-mode-map (kbd "C-z 2") 'my-org-reset-schedule-tomorrow)
;; ----------------------------------------------------------------------
;; * [2014-09-05 金] alias
(fset 'my-org-clone-subtree-with-time-shift-1day
   (lambda (&optional arg) "Keyboard macro."
     (interactive "p")
     (kmacro-exec-ring-item (quote ([3 24 99 49 return 49 100 return 134217821 116 116 19 60 13 134217847 134217837 18 50 48 13 25 134217828 134217828 134217828 134217837] 0 "%d")) arg)))
(define-key org-mode-map (kbd "C-c M-1") 'my-org-clone-subtree-with-time-shift-1day)