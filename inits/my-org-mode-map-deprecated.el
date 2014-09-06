;; -*- mode: emacs-lisp ; coding: utf-8-unix -*-
;; my-org-mode-map-deprecated.el
;; #+LAST_UPDATED: 2014-09-05
;; ----------------------------------------------------------------------
;; my-org-mode-map.el にごみが多い＆ anything を require しない方針にしたので、
;; いったん全ての式を my-org-mode-map-deprecated.el に移動した。
;; 必要な式だけを my-org-mode-map.el に戻す。
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
;; * [2013-11-01 金] 空いているキーバインド
;; (kbd "C-c z")
;; (kbd "C-x C-:") は空いている。
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
